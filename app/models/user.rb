class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  mount_uploader :avatar, AvatarUploader

  has_many :posts , foreign_key: "author", dependent: :destroy
  has_many :comments , foreign_key: "author", dependent: :destroy
  
  validates :nickname, :email, :password, presence: true

  def self.send_report(start_date = "", end_date = "", email = "")
    begin
      Date.parse(start_date) || Date.parse(end_date)
      EmailReportsJob.perform_later(start_date, end_date, email)
    rescue ArgumentError, TypeError
      return false
    end
  end

  def self.sort_by_rating(start_date = nil, end_date = nil)
    User.all.sort_by {|a| a.rating(start_date, end_date) }
  end

  def rating(start_date = nil, end_date = nil)
    if start_date.nil? || end_date.nil?
      search_entire_range
    else
      search_range(start_date, end_date)
    end
  end

  def comments_between_date(start_date, end_date)
    self.comments.where(published_at: start_date..end_date)
  end

  def posts_between_date(start_date, end_date)
    self.posts.where(published_at: start_date..end_date)
  end

  def search_range(start_date, end_date)
    count_posts    = self.posts_between_date(start_date, end_date).count
    count_comments = self.comments_between_date(start_date, end_date).count
    (count_posts + count_comments).to_f/10
  end

  def search_entire_range
    (posts.count + comments.count).to_f/10
  end
end
