class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username, :email, :instagram, :twitter, :status, :description, :flag, :image

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
