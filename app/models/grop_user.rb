class GropUser < ApplicationRecord
  belongs_to :end_user
  belongs_to :group
end
