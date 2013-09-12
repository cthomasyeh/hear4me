module Api
  module V1
    class MicropostsController < ApplicationController
      protect_from_forgery with: :null_session
      before_filter :restrict_access
      respond_to :json

      def create
        @user = User.find(params[:id])
        @micropost = @user.microposts.build(micropost_params)
        if @micropost.save
	  @response = "success"
        else
          @response = "could not create post" 
        end
      end

      def destroy
        @micropost.destroy
      end

    private
      def micropost_params
        params.require(:micropost).permit(:content)
      end
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token) 
        end
      end
    end
  end
end
