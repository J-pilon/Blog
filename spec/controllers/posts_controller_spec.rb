require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "#new" do
    it "responds successfully" do
      get :new
      expect(response).to be_successful
    end

    it "returns 200 response" do 
      get :new
      expect(response).to have_http_status "200"
    end
  end

  describe "#create" do
    it "redirects to #show if attributes are successful" do
      @post = Post.new(title: "test-title", body: "test-body")
      post :create
      expect(response).to redirect_to post_path
    end
  end

  describe "#show" do

    before do
      Post.create(title: "test-title", body: "test-body")
    end

    it "finds the post with the currect id" do
      get :show
      post = Post.find(1)
      expect(post.id).to eq(1)
    end
  end
end