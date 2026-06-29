require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "contentがあれば有効" do
    user = User.new(
      name: "テストユーザー",
      email: "test@example.com",
      password: "password"
    )

    post = Post.new(content: "テスト投稿", user: user)
    assert post.valid?
  end

  test "contentが空なら無効" do
    user = User.new(
      name: "テストユーザー",
      email: "test2@example.com",
      password: "password"
    )

    post = Post.new(content: "", user: user)
    assert_not post.valid?
  end
end
