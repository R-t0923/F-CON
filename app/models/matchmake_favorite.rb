class MatchmakeFavorite < ApplicationRecord
  belongs_to :matchmake
  belongs_to :end_user
end
