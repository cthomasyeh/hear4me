class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
#  after_filter :set_access_control_headers

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
    def download_url_for(audio_key)
      AWS::S3::S3Object.url_for(audio_key, BUCKET, :authenticated => true)
    end
    #def set_access_control_headers
    #  response.headers['Access-Control-Allow-Origin'] = '*'
    #  response.headers['Access-Control-Request-Method'] = '*'
    #end
end
