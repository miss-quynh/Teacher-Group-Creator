require 'rails_helper'

describe HomesController do
  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "renders the :homes template" do
      get :index
      expect(response).to render_template(:homes)
    end
  end

end