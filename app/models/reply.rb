class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: { message: "を入力してください" }, length: { maximum: 120, message: "は120文字以内で入力してください" }
  validate :cannot_reply_again_within_10_seconds

  private

  def cannot_reply_again_within_10_seconds
    return if user_id.blank?

    last_reply = user.replies.where.not(id: id).order(created_at: :desc).first

    if last_reply.present? && last_reply.created_at > 10.seconds.ago
      errors.add(:base, "10秒以上あけましょう！")
    end
  end
end
