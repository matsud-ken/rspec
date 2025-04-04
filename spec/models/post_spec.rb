require "rails_helper"

RSpec.describe Post, type: :model do
    it "新規投稿が成功すること" do
        post = FactoryBot.create(:post)
        expect(post).to be_valid
    end

    it "タイトルが空欄の場合、新規投稿が失敗すること" do
        post = FactoryBot.build(:post, title: nil)
        expect(post).to_not be_valid
    end

    it "内容が空欄の場合、新規投稿が失敗すること" do
        post = FactoryBot.build(:post, content: nil)
        expect(post).to_not be_valid
    end
end
