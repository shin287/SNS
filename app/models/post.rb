class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: { message: "を入力してください" }
end
