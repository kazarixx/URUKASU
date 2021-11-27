class Brand < ApplicationRecord
  has_many :comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
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
  def self.search_for(content, method)
    if method == 'perfect'
      Brand.where(brand_name: content)
    elsif method == 'forward'
      Brand.where('brand_name LIKE ?', content + '%')
    elsif method == 'backward'
      Brand.where('brand_name LIKE ?', '%' + content)
    else
      Brand.where('brand_name LIKE ?', '%' + content + '%')
    end
  end
end
