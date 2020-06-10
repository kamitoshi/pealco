require 'rails_helper'

RSpec.describe "Schedules", type: :request do

  let(:user) {create(:user)}
  let(:other_user) {create(:other_user)}

  describe "スケジュール" do

    before do
      sign_in(user)
    end

    context "スケジュールを登録" do
      it "スケジュールを設定する" do
        visit new_schedule_path
        fill_in('タイトル', with:"test schedule")
        click_on("登録")
        pending
        expect(Schedule.count).to eq 1
      end
    end

  end

end
