class AudiosController < ApplicationController  
  def index  
    @audios = AWS::S3::Bucket.find('thunder002').objects  
  end 
end
