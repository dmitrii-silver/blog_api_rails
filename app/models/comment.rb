class Comment < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "author"
  belongs_to :post, class_name: "Post", foreign_key: "post"

  validates :body, :user, presence: true
end
