require "rails_helper"

RSpec.describe PagesController, :type => :controller do
  render_views

  describe "GET home" do
    it "has a 200 status code" do
      get :home
      expect(response.status).to eq(200)
    end

    it "has a home related heading" do
      get :home
      expect(response.body).to match /<h1>.*homepage/im
    end
  end
end