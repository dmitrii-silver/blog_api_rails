class Post < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "author"
  has_many :comments , foreign_key: "post", dependent: :destroy

  validates :title, :body, :user, presence: true
end
