class TeammateFavorite < ApplicationRecord
  belongs_to :teammate_recruitment
  belongs_to :end_user
end
