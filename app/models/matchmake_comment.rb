class MatchmakeComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :matchmake

  validates :comment, presence: true, length: {maximum: 40}
end
