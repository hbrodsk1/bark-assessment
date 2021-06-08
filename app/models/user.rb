class User < ApplicationRecord
  has_many :dogs, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_dogs, through: :likes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
