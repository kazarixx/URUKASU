class Brand < ApplicationRecord
  has_many :comments
  has_many :favorites
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
