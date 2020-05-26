require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "スケジュール管理に関するテスト" do

    let(:schedule) {create(:schedule)}

    context "有効なスケジュール" do
      
      it "不備のないスケジュールデータ" do
        expect(schedule).to be_valid
      end

    end

    context "無効なスケジュール" do

      it "タイトルのないスケジュールデータ" do
        schedule.title = ""
        expect(schedule).to_not be_valid
      end

      it "内容が400文字を超えるスケジュールデータ" do
        schedule.content = "a"*401
        expect(schedule).to_not be_valid
      end

      it "日にち指定のないスケジュールデータ" do
        schedule.start_date = ""
        expect(schedule).to_not be_valid
      end

      it "ユーザーと紐づいていないスケジュールデータ" do
        schedule.user_id = nil
        expect(schedule).to_not be_valid
      end

    end

  end
end
