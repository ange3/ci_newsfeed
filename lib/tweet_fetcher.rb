module TweetFetcher
  extend self

  '''
  Fetches all tweets on timelines of CI usernames and all tweets that mention the given usernames.
  Saves each tweet as a TweetsReal object in the local db.
  *  Usernames: main CI, CI Bay Area, CI Dominican Republic.
  '''
  def fetch_tweets_and_persist!
    ci_usernames = ["Children_Intl", "CIBayArea", "ChildrenRD"]
    ci_usernames.each do |username|
      client.user_timeline(username).map do |element|
        client.status(element.id)
      end.each do |tweet|
        TweetsReal.find_or_initialize_by(
          twt_id: tweet.id,
        ).update!(
          username: tweet.user.screen_name,
          twt_created_at: tweet.created_at,
          twt_text: tweet.text,
          twt_center: username,
        )
      end
    end
    ci_usernames.each do |username|
      client.search("@#{username} -rt").collect do |tweet|
        TweetsReal.find_or_initialize_by(
          twt_id: tweet.id,
        ).update!(
          username: tweet.user.screen_name,
          twt_created_at: tweet.created_at,
          twt_text: tweet.text,
          twt_center: username,
        )
      end
    end
    puts 'Num Tweets:', TweetsReal.all.length
  end

  '''
  Removes tweets in the database that have "RT" in the text
  '''
  def remove_retweets
    puts 'orig num records', TweetsReal.all.length
    TweetsReal.all.each do |tweet|
      if tweet.twt_text.include? "RT"
        TweetsReal.delete(tweet.id)
      end
    end
    puts 'new num records', TweetsReal.all.length
  end

  private

  '''
  Client connects to Twitter API with application-only credentials
  '''
  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = "JZGYoTPOZTVcvtbKYnvmY1otI"
      config.consumer_secret     = "DayfYC8hpEVxYavbejdSiOKD6YsbkDRsdAxAUMDbVG09aAubw8"
      config.access_token        = "607346453-xbJEV4cwCDvJgrGyYFHQpLc47JQ5ogiJWCkTPp08"
      config.access_token_secret = "jc8gCXsgy9O5MOiq8YsEqk0pAg1rQUWfGiZqyknlJHvUy"
    end
  end
end