class User < ApplicationRecord
  has_secure_password validations: false

  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy

  validates :name, presence: { message: "を入力してください" }
  validates :email, presence: { message: "を入力してください" }, uniqueness: true
  validates :password, presence: { message: "を入力してください" }, confirmation: { message: "が一致しません" }
  validates :password_confirmation, presence: { message: "を入力してください" }
end
