class Comment < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "author"

  before_validation :set_published_at
  validates :body, :user, :published_at, presence: true

  private

  def set_published_at
    self.published_at = Time.now.to_date if self.published_at.blank?
  end
end
