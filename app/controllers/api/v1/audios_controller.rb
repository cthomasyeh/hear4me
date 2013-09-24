module Api
  module V1
    class AudiosController < ApplicationController
      protect_from_forgery with: :null_session
      #before_filter :restrict_access
      respond_to :json
      def index
        @audios = AWS::S3::Bucket.find(BUCKET).objects  
      end

      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token) 
        end
      end
    end
  end
end
