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
