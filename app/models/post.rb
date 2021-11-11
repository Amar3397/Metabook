class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :images, as: :imageable
  
end
