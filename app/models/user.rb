class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  validates :kanji_family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :kanji_first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :kana_family_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true
end
