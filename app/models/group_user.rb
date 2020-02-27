class GroupUser < ApplicationRecord
  belongs_to :end_user, class_name: 'EndUser', foreign_key: 'user_id'
  belongs_to :group
end
