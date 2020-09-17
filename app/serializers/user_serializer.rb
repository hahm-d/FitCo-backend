class UserSerializer < ActiveModel::Serializer
  attributes :username, :password, :email, :instagram, :twitter, :status, :description
end
