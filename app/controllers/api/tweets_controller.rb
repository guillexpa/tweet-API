module Api
  class TweetsController < ApplicationController
    before_action :ensure_tweet, only: [:show, :destroy]
    before_action :authenticate

    def index
      tweets = Tweet.all
      render json: tweets
    end

    def show
      render json: @tweet.to_json, status: :ok
    end

    def create
      tweet = Tweet.new(  message: params[:tweet][:message],
                          user_id: current_user.id
                        )

      if tweet.save
        render json: tweet, status: :created
      else
        render json: { errors: tweet.errors.full_messages }, status: 422
      end
    end

    def destroy
      render json: @tweet.destroy
    end


    private

    def ensure_tweet
      @tweet = Tweet.find_by(id: params[:id])
      render(json: { errors: "Tweet wit the id #{params[:id]} is not found"}, status: 400) unless @tweet
    end

    # def params_tweet
    #   params.require(:tweet).permit(:message)
    # end


    protected

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        User.find_by(auth_token: token)
      end
    end

  end

end
