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

  describe "#edit" do 
    let(:post) {Post.create(title: "test-title", body: "test-body")}

    it "respondes successfully" do
      get :edit, params: { id: post.id}
      expect(response).to be_successful
    end

    it "returns a 200 status code" do
      get :edit, params: { id: post.id}
      expect(response).to have_http_status("200")
    end
  end

  describe "#destroy" do
    it "reduces the count of posts by one" do
      @post = Post.create(title: "title one", body: "this is the body of the first post")
      expect {
        delete :destroy, params: { id: @post.id }
      }.to change(Post, :count).by(-1)
    end

    it "redirects the user to index page" do
      @post = Post.create(title: "title one", body: "this is the body of the first post")
      delete :destroy, params: { id: @post.id }
      expect(response).to have_http_status("302")
    end
  end
end