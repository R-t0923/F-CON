class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :teammate_comments, dependent: :destroy
  has_many :teammate_favorites, dependent: :destroy
  has_many :matchmake_comments, dependent: :destroy
  has_many :matchmake_favorites, dependent: :destroy
  

  attachment :user_image
  
        
  enum age: {"18歳以下":0, "20代":1, "30代":2, "40代":3, "50代":4, "60歳以上":5}
  enum gender: {"男性":0, "女性":1}

  # ニックネームによる絞り込み
  scope :get_by_nick_name, ->(nick_name) {
  where("nick_name like ?", "%#{nick_name}%")
  }
    # 年齢による絞り込み
  scope :get_by_age, ->(age) {
  where(age: age)
  }
    
  validates :nick_name, presence: true, length: {maximum: 15 }
  #ハイフン込みで電話番号を入力
  validates :phone_number, format: { with: /\A\d{3}[-]\d{4}[-]\d{4}\z/ }
  validates :introduction, length: {maximum: 500 }
  
  validates :gender, presence: true
  validates :age, presence: true
  # 半角数字のみ
  validates :soccer_experience, format: { with:/\A[0-9]+\z/}
  validates :fotsal_experience, format: { with:/\A[0-9]+\z/}
  

  #論理削除(paranoia)を使うための記述
  acts_as_paranoid

end
