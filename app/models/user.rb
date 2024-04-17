class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :password, :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)\w{6,}\z/ , message: '英数字混合で入力してください' }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true

end
