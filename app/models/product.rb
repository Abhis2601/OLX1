class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  has_one :purchase ,dependent: :destroy
  validates :name ,:alphanumeric_id,:description ,presence: true
  validates :alphanumeric_id,uniqueness:true 
  enum status:[:available ,:sold]

  has_one_attached :image 
end
