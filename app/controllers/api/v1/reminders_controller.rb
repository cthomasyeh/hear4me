module Api
  module V1
    class RemindersController < ApplicationController
      protect_from_forgery with: :null_session
      #before_filter :restrict_access
      respond_to :json

      def create
        @user = User.find(params[:id])
        @reminder = @user.reminders.build(reminder_params)
        if @reminder.save
	  @response = "success"
        else
          @response = "could not create reminder" 
        end
      end

      def destroy
        @reminder = Reminder.find(params[:id])
        @reminder.destroy
        # TODO need to check if the post id belongs to user uid
        #@response = @user.name 
        @response = "success"
      rescue ActiveRecord::RecordNotFound
        @response = "cound not delete reminder, record not found"
      end

      def update
	@reminder = Reminder.find(params[:id])
	params.each do |key, value|
	  if @reminder.has_attribute?(key) 
	    @reminder.update_attribute(key, value)
	  end
	end
	
        if @reminder.save
          @response = "success"
        else 
          @response = "could not update reminder"
        end
      end
    private
      def reminder_params
	params.require(:reminder).permit(:text, :audio_link, :photo_link, :first, :second, :third, :fourth, :fifth, :sixth, :frequency )
      end
      def restrict_access
        authenticate_or_request_with_http_token do |token, options|
          ApiKey.exists?(access_token: token) 
        end
      end
    end
  end
end
