class Post < ApplicationRecord
    belongs_to :poster, class_name: "User", foreign_key: "user_id", optional: true
    has_many :comments, dependent: :destroy
    has_many_attached :images
end
