module Api
  module V1
    class UsersController < ApplicationController
#      before_filter :restrict_access
      respond_to :json

      def index
#        respond_with User.all
	@users = User.all
      end

      def show
	@user = User.find(params[:id])
        @microposts = @user.microposts
        #respond_with User.find(params[:id])
      end

      def feed
        @user = User.find(params[:id])
        @feed = @user.feed
      end

      def following
        @user = User.find(params[:id])
        @users = @user.followed_users
      end

      def followers
        @user = User.find(params[:id])
        @users = @user.followers
      end

      def followedby
        @user = User.find(params[:id])
        @other = User.find(params[:other])
        @relationship = Relationship.find_by(follower_id: @other, followed_id: @user)
        if @relationship.nil? 
	  @error = "record not found"
        else
        end
      rescue ActiveRecord::RecordNotFound
        @error = "record not found"
      end
    private
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token) 
        end
      end

    end  
  end
end	
