class Matchmake < ApplicationRecord
  belongs_to :group
  has_many :matchmake_comments, dependent: :destroy
  has_many :matchmake_favorites, dependent: :destroy

  # 引数に渡されたend_userがmatchmake_favoritesに存在するか調べ、存在すればtrue,しなければfalseを返す
  def favorited_by?(end_user)
		matchmake_favorites.where(end_user_id: end_user.id).exists?
	end
  
  enum level: {"超初級ーウルトラビギナー":0, "初級－スーパービギナー":1, "中級－ビギナー":2, "上級－エンジョイ":3}
  enum category: {"男性":0, "女性":1, "ミックス":2, "オーバー30":3, "オーバー40":4}
  
  # 募集レベルによる絞り込み
  scope :get_by_level, ->(level) {
  where(level: level)
  }
  scope :get_by_day, ->(day) {
  where(day: day)
  }
  scope :get_by_category, ->(category) {
  where(category: category)
  }
  # groupのnameを結合
  scope :get_by_name, -> name {
    joins(:group).where('groups.name = ?', name)
  }

  validates :title, presence: true, length: {maximum: 30}
  validates :money, presence: true, length: {maximum: 100}
  validates :place, presence: true, length: {maximum: 100}
  validates :level, presence: true
  validates :day, presence: true
  validates :time, presence: true
  validates :category, presence: true
  validates :capacity, presence: true
  validates :introduction, presence: true, length: {maximum: 1000}
end
