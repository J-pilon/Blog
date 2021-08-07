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

  
end