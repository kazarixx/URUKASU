class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :brands
  has_many :favorites, dependent: :destroy
  validates :name, presence: true,length: { in: 2..15 }
  validates :email, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
end
