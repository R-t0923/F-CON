class Teammate < ApplicationRecord
  belongs_to :group

  enum level: {"指定なし":0,"超初級ーウルトラビギナー":1, "初級－スーパービギナー":2, "中級－ビギナー":3, "上級－エンジョイ":4 }

  validates :title, presence: true, length: {maximum: 30}
  validates :schedule, presence: true, length: {maximum: 100}
  validates :money, presence: true, length: {maximum: 100}
  validates :level, presence: true
  validates :introduction, presence: true, length: {maximum: 1000}
  
end
