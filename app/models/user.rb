class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,  presence: true, uniqueness: { case_sensitive: true }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,     presence: true, uniqueness: { case_sensitive: true }, format: { with: VALID_EMAIL_REGEX }

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password,  presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }

  validates :last_name,       presence: true,  format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana,  presence: true,  format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name,      presence: true,  format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date,      presence: true
end
