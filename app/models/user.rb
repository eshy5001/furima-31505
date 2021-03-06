class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :last_name
    validates :last_name_kana
    validates :first_name
    validates :first_name_kana
    validates :birth_date
  end

  with_options uniqueness: { case_sensitive: true } do
    validates :nickname
    validates :email
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
    validates :last_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,     format: { with: VALID_EMAIL_REGEX }

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password,  length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }
end
