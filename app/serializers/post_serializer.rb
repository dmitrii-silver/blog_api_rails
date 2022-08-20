class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published_at
  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
    attributes :nickname
  end

  def published_at
    object.published_at.strftime("%d-%m-%Y %H:%M:%S")
  end
end
