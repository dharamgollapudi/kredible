require "rails_helper"

RSpec.describe Api::SchoolsController, type: :controller do
  before :each do
    @schools = 10.times.inject([]) do |_schools_, _|
      _schools_ << FactoryGirl.create(:school) 
    end 
  end

  describe "GET index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template("index")
    end

    it "assigns all of the schools into @schools" do
      get :index

      expect(assigns(:schools)).to match_array(@schools)
    end
  end
end