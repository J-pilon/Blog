require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "#new" do
    it "responds successfully" do
      get :new
      expect(response).to be_successful
    end

    it "returns 200 response" do 
      get :new
      expect(response).to have_http_status("200")
    end
  end

  describe "#create" do
    it "redirects to #show if attributes are successful" do
    # ruby keyword arguments - search
      post :create, params: {post: {title: "test-title", body: "test-body"}}
      @post = Post.first
      expect(response).to redirect_to post_path(@post.id)
    end
  end

  describe "#show" do
  # lazy loading vs ego loading
    let(:post) {Post.create(title: "test-title", body: "test-body")}

    it "finds the post with the currect id" do
      get :show, params: {id: post.id}
      expect(response).to be_successful
    end

    it "returns a 200 status code" do
      get :show, params: {id: post.id}
      expect(response).to have_http_status("200")
    end
  end

  describe "#index" do
    it "respondes successfully" do
      get :index
      expect(response).to be_successful
    end

    it "returns a 200 status code" do
      get :index
      expect(response).to have_http_status("200")
    end
  end
end