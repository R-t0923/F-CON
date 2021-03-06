class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :end_users, through: :group_users
  has_many :teammate_recruitments, dependent: :destroy
  has_many :matchmakes, dependent: :destroy
  
  belongs_to :end_user

  def join_by?(end_user)
		group_users.where(end_user_id: end_user.id).exists?
	end
  
  # rifileで画像を登録できるようにするための記述
  attachment :group_image
  enum city: {"千代田区":0, "中央区":1, "港区":2, "新宿区":3, "文京区":4, "台東区":5, "墨田区":6, "江東区":7, "品川区":8, "目黒区":9, "大田区":10, "世田谷区":11, "渋谷区":12, "中野区":13, "杉並区":14, "豊島区":15, "北区":16, "荒川区":17, "板橋区":18, "練馬区":19, "足立区":20, "葛飾区":21, "江戸川区":22}
  enum category: {"男性":0, "女性":1, "ミックス":2, "オーバー30":3, "オーバー40":4}
  enum level: {"超初級ーウルトラビギナー":0, "初級－スーパービギナー":1, "中級－ビギナー":2, "上級－エンジョイ":3}

  # チーム名による絞り込み
  scope :get_by_name, ->(name) {
  where("name like ?", "%#{name}%")
  }
  # 活動地域による絞り込み
  scope :get_by_city, ->(city) {
  where(city: city)
  }
  # カテゴリーによる絞り込み
  scope :get_by_category, ->(category) {
    where(category: category)
  }

  validates :name, presence: true, length: {maximum: 20 }
  validates :city, presence: true
  validates :category, presence: true
  validates :level, presence: true
  # 半角数字のみ
  validates :male_member, format: { with:/\A[0-9]+\z/}
  validates :female_member, format: { with:/\A[0-9]+\z/}
  validates :average_age, format: { with:/\A[0-9]+\z/}
  validates :group_introduction, presence: true,length: {maximum: 1000 }
end
