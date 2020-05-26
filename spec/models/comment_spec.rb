require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "コメントモデルに関するテスト" do

    let(:user) {create(:user)}
    let(:post) {create(:post, user_id: user.id)}

    context "有効なコメント" do
        
      it "不備のないコメント" do
        comment = build(:comment, user_id: user.id, post_id: post.id)
        expect(comment).to be_valid
      end
    end

    context "無効なコメント" do
      it "空欄のコメント" do
        comment = build(:comment, user_id: user.id, post_id: post.id, content: " ")
        expect(comment).to_not be_valid
      end
      it "200文字以上のコメント" do
        comment = build(:comment, user_id: user.id, post_id: post.id, content: "a"*201)
        expect(comment).to_not be_valid
      end
    end
    
  end
end
