class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :content, :url, :views, :likes, :image, :video
  has_one :user

  def image
    if object.image.attached?
      {
        cloudinary: object.image.service_url
     }
    end
  end

  def video
    if object.video.attached?
      {
        cloudinary: object.video.service_url
     }
    end
  end

end
