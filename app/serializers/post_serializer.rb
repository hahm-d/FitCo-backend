class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :content, :url, :views, :likes, :image
  has_one :user

  def image
    if object.image.attached?
      {
        url: rails_blob_url(object.image, default_url_options[:host]),
        cloudinary: object.image.service_url
     }
    else
      {
        url: "",
        cloudinary: "",
      }
    end
  end

end
