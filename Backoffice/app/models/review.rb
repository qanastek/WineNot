class Review < ApplicationRecord
  belongs_to :user
  belongs_to :wine

  validates :name, :description, :stars, presence: true
  # validates :email, uniqueness: true
end
