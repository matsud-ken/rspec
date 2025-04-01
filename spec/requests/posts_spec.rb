require 'rails_helper'

RSpec.describe "Posts", type: :request do
    describe "POST #create" do
        let(:valid_params) { { post: { title: "Title", content: "Content" } } }

        it "creates a Post" do
            post posts_path, params: valid_params
            expect(response).to have_http_status(:found)
        end
    end
end