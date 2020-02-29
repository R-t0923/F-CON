class Teammate < ApplicationRecord
  belongs_to :group
  has_many :teammate_comments

  enum level: {"誰でもOK！！":0,"男性のみ":1, "女性のみ":2, "経験者":3, "20代のみ":4,"30代のみ":5, "40代のみ":6, "50代のみ":7, "60歳以上歓迎":8 }

  validates :title, presence: true, length: {maximum: 30}
  validates :schedule, presence: true, length: {maximum: 100}
  validates :money, presence: true, length: {maximum: 100}
  validates :level, presence: true
  validates :introduction, presence: true, length: {maximum: 1000}
  
end
