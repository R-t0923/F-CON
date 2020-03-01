class TeammateComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :teammate_recruitment
end
