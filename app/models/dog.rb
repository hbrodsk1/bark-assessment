class Dog < ApplicationRecord
  has_many_attached :images
  has_many :likes, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
end
