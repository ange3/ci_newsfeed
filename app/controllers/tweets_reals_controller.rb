class TweetsRealsController < ApplicationController
  before_action :set_tweets_real, only: [:show, :edit, :update, :destroy]

  # GET /tweets_reals
  # GET /tweets_reals.json
  def index
    # @tweets_reals = TweetsReal.all
    @tweets_all = TweetsReal.order(twt_created_at: :desc) # call all tweets in descending created_at order
  end

  # GET /tweets_reals/1
  # GET /tweets_reals/1.json
  def show
  end

  def display
    @tweets_all = TweetsReal.order(twt_created_at: :desc)
  end

  # DELETE /tweets_reals/1
  # DELETE /tweets_reals/1.json
  def destroy
    @tweets_real.destroy
    respond_to do |format|
      format.html { redirect_to tweets_reals_url, notice: 'Tweets real was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweets_real
      @tweets_real = TweetsReal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweets_real_params
      params[:tweets_real]
    end
end
