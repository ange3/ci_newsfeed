module TweetFetcher
  extend self

  '''
  Fetches tweets of all CI usernames listed, saves each tweet as a TweetsReal object in the local db.
  '''

  def fetch_tweets_and_persist!
    %w(
      Children_Intl
      CIBayArea
    ).each do |username|
      client.user_timeline(username).map do |element|
        client.status(element.id)
      end.each do |tweet|
        TweetsReal.find_or_initialize_by(
          twt_id: tweet.id,
        ).update!(
          username: tweet.user.screen_name,
          twt_created_at: tweet.created_at,
          twt_text: tweet.text,
        )
      end
    end
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