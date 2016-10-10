module Api
  class TweetsController < ApplicationController
    before_action :ensure_tweet, only: [:show, :destroy]

    def index
      tweets = Tweet.all
      render json: tweets, include: :user
    end

    def show
      render json: @tweet.to_json, status: :ok
    end

    def create
      newtweet = Tweet.new(params_tweet)

      if newtweet.save
        render json: newtweet, status: :created
      else
        render json: { errors: newtweet.errors.full_messages }, status: 422
      end
    end

    def destroy
      render json: @tweet.destroy
    end


    private

    def ensure_tweet
      @tweet = Tweet.find_by(id: params[:id])
      render(json: { errors: "Tweet wit the id #{params[:id]} is not found"}, status: 404) unless @tweet
    end

    def params_tweet
      params.require(:tweet).permit(:message)
    end

  end

end
