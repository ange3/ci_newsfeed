class TweetsController < ApplicationController
  # GET /tweets
  # GET /tweets.json
  def index
    Rails.logger.info 'INDEX PARAMS:'
    Rails.logger.info params.inspect
    @tweets = []
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    Rails.logger.info 'SHOW PARAMS:'
    Rails.logger.info params.inspect
  end

  def test
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "JZGYoTPOZTVcvtbKYnvmY1otI"
      config.consumer_secret     = "DayfYC8hpEVxYavbejdSiOKD6YsbkDRsdAxAUMDbVG09aAubw8"
      config.access_token        = "607346453-xbJEV4cwCDvJgrGyYFHQpLc47JQ5ogiJWCkTPp08"
      config.access_token_secret = "jc8gCXsgy9O5MOiq8YsEqk0pAg1rQUWfGiZqyknlJHvUy"
    end
    # do this for each CI Center
    @tweets = client.user_timeline("Children_Intl")
    @tweets.each do |element|
      tweetid = element.id
      @tweet = client.status(tweetid)      
      # puts @tweet.hashtags[0]
    end
    # iterate through all tweets, display each tweet's words, who wrote it, and date
    #for (int i = 0; i < tweets.length; i++)
    #{
      # client.status(tweets[i].id)
    #}

    # @tweets = Twitter.user_timeline[0..4]
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def tweet
    @tweet ||= nil # TODO: make a network call and retrieve the tweet.
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tweet_params
    params[:tweet]
  end
end
