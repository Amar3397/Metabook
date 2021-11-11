class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :images, as: :imageable
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"  
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user  
   
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :avatar

  def avatar_thumbnail
    if avatar.attached?   
      avatar.variant(resize: '120x120!').processed 
    else
      "/default_profile.jpg"
    end
  end

  def username
    return self.email.split('@')[0].capitalize
  end

end
