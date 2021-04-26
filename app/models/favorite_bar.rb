class FavoriteBar < ApplicationRecord
  belongs_to :user
  belongs_to :bar
end
