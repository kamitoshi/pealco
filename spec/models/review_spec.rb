require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "レビューモデルに関するテスト" do

    let(:review) {build(:review)}

    context "有効なデータ" do
      it "全ての入力項目が適切" do
        expect(review).to be_valid
      end
      it "コメントがなくても星の数だけで有効" do
        review.content = ""
        expect(review).to be_valid
      end
    end

    context "無効なデータ" do
      it "ratingがない" do
        review.rating = nil
        expect(review).to_not be_valid
      end
      it "内容が400文字を超える" do
        review.content = "a"*401
        expect(review).to_not be_valid
      end
    end
  end
end