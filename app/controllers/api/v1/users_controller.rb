module Api
  module V1
    class UsersController < ApplicationController
      before_filter :restrict_access
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

    private
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token) 
        end
      end

    end  
  end
end	
