module ApplicationHelper
  def download_url_for(audio_key)
    AWS::S3::S3Object.url_for(audio_key, BUCKET, :authenticated => true)
  end
  def full_title(page_title)
    base_title = "TheCoolDoc's Hear4.Me"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
