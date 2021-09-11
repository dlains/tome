RSpec.describe "Posts", type: :request do
  let!(:post) { create(:post) }

  describe "GET /index" do
    it "returns http success" do
      get "/posts"
      expect(response).to have_http_status(:success)
    end
  end
end
