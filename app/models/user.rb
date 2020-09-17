class User < ApplicationRecord
    has_many :posts, class_name: "Post", foreign_key: "poster_id", dependent: :destroy
    has_many :comments, class_name: "Comment", foreign_key: "commenter_id", dependent: :destroy
    has_many :types, class_name: "Type", foreign_key: "user_id", dependent: :destroy
    
    has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower

    def follow(user)
        active_relationships.create(followed_id: user.id)
    end

    def unfollow(user)
        active_relationships.find_by(followed_id: user.id).destroy
    end

    def following?(user)
        following.include?(user)
    end

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
