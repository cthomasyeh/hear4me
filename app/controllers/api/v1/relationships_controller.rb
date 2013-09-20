module Api
  module V1
    class RelationshipsController < ApplicationController
      protect_from_forgery with: :null_session
      #before_filter :restrict_access
      respond_to :json

      def create
        @follower = User.find(params[:followedby])
        @followed = User.find(params[:id])
        @follower.follow!(@followed)
        @response = "success"
      rescue ActiveRecord::RecordNotUnique
        @response = "relationship already existed"
      end

      def destroy
        @user_id = Relationship.find(params[:id]).followed
        @follower_id = Relationship.find(params[:id]).follower
        @follower = User.find(@follower_id)
        @follower.unfollow!(@user_id)
        @response = "success" 
      rescue ActiveRecord::RecordNotFound
        @response ="cound not delete, relationship does not exist"
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
