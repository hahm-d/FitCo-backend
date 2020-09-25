class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :content, :url, :views, :likes, :image, :video
  has_one :user

  def image
    if object.image.attached?
      {
        url: rails_blob_url(object.image, default_url_options[:host]),
        cloudinary: object.image.service_url
     }
    end
  end

  def video
    if object.video.attached?
      {
        url: rails_blob_url(object.video, default_url_options[:host]),
        cloudinary: object.video.service_url
     }
    end
  end

end
