class Brand < ApplicationRecord
  has_many :comments,dependent: :destroy
  has_many :favorites
  belongs_to :user
  validates :brand_name, presence: true
  validates :prefecture_id, presence: true
  validates :jan, length: { is: 13 },numericality: { only_integer: true }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  attachment :brand_image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
