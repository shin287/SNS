class User < ApplicationRecord
  has_secure_password validations: false

  has_many :posts
  has_many :replies

  validates :name, presence: { message: "を入力してください" }
  validates :email, presence: { message: "を入力してください" }, uniqueness: true
  validates :password, presence: { message: "を入力してください" }
  validates :password_confirmation, presence: { message: "を入力してください" }
end
