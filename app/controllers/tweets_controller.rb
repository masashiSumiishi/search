class TweetsController < ApplicationController
before_action :twitter_client, only: [:search]

  def search
    @tweets = []
    if params[:keyword].present?
      tweets = @client.search(params[:keyword], result_type: "recent").take(50)
      tweets.each do |tw|
        @tweets << tw.text
      end
    end
  end

  def twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret     = Rails.application.secrets.twitter_consumer_secret
      config.access_token        = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
    end
  end
end
