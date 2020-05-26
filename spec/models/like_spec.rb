require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "お気に入り投稿に関するテスト" do

    let(:user) {create(:user)}
    let(:post) {create(:post)}
    
    context "有効なお気に入り" do

      it "不備のないお気に入り" do
        like = build(:like, user_id: user.id, post_id: post.id)
        expect(like).to be_valid
      end

    end

    context "無効なお気に入り" do

      it "お気に入り先の投稿がない" do
        like = user.likes.build(post_id: nil)
        expect(like).to_not be_valid
      end

      it "既にお気に入りしている投稿" do
        like = user.likes.build(post_id: post.id)
        dup_like = like.dup
        like.save
        expect(dup_like).to_not be_valid
      end

    end

  end
end
