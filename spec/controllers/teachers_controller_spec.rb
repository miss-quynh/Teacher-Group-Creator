require 'rails_helper'

describe TeachersController do
  let(:teacher) { Teacher.create(first_name: 'Pringles', last_name: 'Green', email: 'pgreen@gmail.com', password: 'pringlesforlife') }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns the teachers list as @teachers" do
      get :index
      expect(assigns(:teachers)).to eq(Teacher.all)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, params: { id: teacher.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct teacher as @teacher" do
      get :show, params: { id: teacher.id }
      expect(assigns(:teacher)).to eq(teacher)
    end

    it "renders the :show template" do
      get :show, params: { id: teacher.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns a new teacher as @teacher" do
      get :new
      expect(assigns(:teacher)).to be_a_new Teacher
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    before do
      post :create, params: { teacher: { first_name: 'Pringles', last_name: 'Green', email: 'pgreen@gmail.com', password: 'pringlesforlife'} }
    end

    context "when valid params are passed" do
      it "responds with status code 302" do
        expect(response).to have_http_status 302
      end

      it "creates a new teacher in the database" do
        expect{
          post :create, params: { teacher: { Teacher.create(first_name: 'Pringles', last_name: 'Green', email: 'pgreen@gmail.com', password: 'pringlesforlife') } }
        }.to change{Teacher.count}.by(1)
      end
    end
  end

end