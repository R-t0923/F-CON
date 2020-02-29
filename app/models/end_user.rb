class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users
  #has_many :teammates, dependent: :destroy
  has_many :teammate_comments
  attachment :user_image
  
        
  enum age: {"18歳以下":0, "20代":1, "30代":2, "40代":3, "50代":4, "60歳以上":5}
  enum gender: {"男性":0, "女性":1}

  validates :nick_name, presence: true, length: {maximum: 15 }
  validates :introduction, length: {maximum: 500 }
  #ハイフン込みで電話番号を入力
  validates :phone_number, presence: true, format: { with: /\A\d{3}[-]\d{4}[-]\d{4}\z/ }
  validates :gender, presence: true
  validates :age, presence: true
  # 半角数字のみ
  validates :fotsal_experience, presence: true, format: { with:/\A[0-9]+\z/}
  validates :soccer_experience, presence: true, format: { with:/\A[0-9]+\z/}

  #論理削除(paranoia)を使うための記述
  acts_as_paranoid

end
