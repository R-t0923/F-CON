class TeammateComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :teammate_recruitment

  validates :comment, presence: true, length: {maximum: 40}
end
