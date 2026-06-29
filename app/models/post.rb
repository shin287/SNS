class Post < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates :content, presence: { message: "を入力してください" }, length: { maximum: 200, message: "は200文字以内で入力してください" }
  validate :cannot_post_again_within_10_seconds

  private

  def cannot_post_again_within_10_seconds
    return if user_id.blank?

    last_post = user.posts.where.not(id: id).order(created_at: :desc).first

    if last_post.present? && last_post.created_at > 10.seconds.ago
      errors.add(:base, "連続投稿は10秒以上あけてください")
    end
  end
end
