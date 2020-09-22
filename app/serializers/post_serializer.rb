class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :content, :url, :views, :likes, :image
  has_one :user

  def featured_image
    if object.image.attached?
      {
        url: rails_blob_url(object.image)
      }
    end
  end

end
