class Wine < ApplicationRecord
  belongs_to :wine_color
  belongs_to :wine_maker
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
