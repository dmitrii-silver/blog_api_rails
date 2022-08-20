class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :posts , foreign_key: "author", dependent: :destroy
  has_many :comments , foreign_key: "author", dependent: :destroy
  
  validates :nickname, :email, :password, presence: true
end
