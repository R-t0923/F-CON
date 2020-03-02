class TeammateRecruitment < ApplicationRecord
  belongs_to :group
  has_many :teammate_comments, dependent: :destroy
  has_many :teammate_favorites, dependent: :destroy

  # 引数に渡されたend_userがteammate_favoritesに存在するか調べ、存在すればtrue,しなければfalseを返す
  def favorited_by?(end_user)
		teammate_favorites.where(end_user_id: end_user.id).exists?
	end
  
  enum level: {"誰でもOK！！":0,"男性のみ":1, "女性のみ":2, "経験者":3, "20代のみ":4,"30代のみ":5, "40代のみ":6, "50代のみ":7, "60歳以上歓迎":8 }
  
  # 募集レベルによる絞り込み
  scope :get_by_level, ->(level) {
  where(level: level)
  }
  
  

  validates :title, presence: true, length: {maximum: 30}
  validates :schedule, presence: true, length: {maximum: 100}
  validates :money, presence: true, length: {maximum: 100}
  validates :level, presence: true
  validates :introduction, presence: true, length: {maximum: 1000}
  
end
