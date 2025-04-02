require 'rails_helper'

RSpec.describe "Posts", type: :request do

    describe "GET #index" do
        it "リクエストが成功すること" do
            get posts_path
            expect(response).to have_http_status(:ok)
        end
        it "Post一覧が取得できること" do
            post = FactoryBot.create(:post)
            get posts_path
            expect(assigns(:posts)).to match_array(post)
        end
        it "indexページが表示されること" do
            get posts_path
            expect(response).to render_template :index
        end
    end

    describe "GET #show" do
        it "リクエストが成功すること" do
            post = FactoryBot.create(:post)
            get post_path(post)
            expect(response).to have_http_status(:ok)
        end
        it "showページが表示されること" do
            post = FactoryBot.create(:post)
            get post_path(post)
            expect(response).to render_template :show
        end
    describe "POST #create" do
        let(:valid_params) { { post: { title: "Title", content: "Content" } } }

        it "creates a Post" do
            post posts_path, params: valid_params
            expect(response).to have_http_status(:found)
        end
    end
end