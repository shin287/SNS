class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: { message: "を入力してください" }
end
