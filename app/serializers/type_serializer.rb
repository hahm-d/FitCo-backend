class TypeSerializer < ActiveModel::Serializer
  attributes :id, :type
  has_one :user
end
