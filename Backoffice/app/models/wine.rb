class Wine < ApplicationRecord
  belongs_to :wine_color
  belongs_to :wine_maker
end
