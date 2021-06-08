class Like < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validates :user_id, :dog_id, presence: true
end
