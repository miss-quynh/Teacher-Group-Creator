require 'rails_helper'

describe StudentsController do
  let(:student) { Student.create(first_name: 'Quynh', last_name: 'Nguyen', grade_level: 12, gender: 'female', gpa: 3.9) }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      p student
      get :show, { student.id }
      expect(response).to have_http_status 200
    end
  end

end