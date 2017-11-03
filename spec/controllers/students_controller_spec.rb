require 'rails_helper'

describe StudentsController do
  let(:student) { Student.create(first_name: 'Quynh', last_name: 'Nguyen', grade_level: 12, gender: 'female', gpa: 3.9, detentions: 0, shirt_size: 'small') }
  let(:teacher) { Teacher.create(first_name: 'Dillon', last_name: 'Nguyen', email: 'dillon2@gmail.com', password: 'dillondillon') }

  before do
    session[:teacher_id] = teacher.id
  end

  describe "GET #index" do
    context "when user is logged in" do
      it "responds with status code 200" do
        get :index
        expect(response).to have_http_status 200
      end

      it "assigns the students list as @students" do
        get :index
        expect(assigns(:students)).to eq(Student.all)
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end

  describe "GET #show" do
    context "when user is logged in" do
      it "responds with status code 200" do
        get :show, params: { id: student.id }
        expect(response).to have_http_status 200
      end

      it "assigns the correct student as @student" do
        get :show, params: { id: student.id }
        expect(assigns(:student)).to eq(student)
      end

      it "renders the :show template" do
        get :show, params: { id: student.id }
        expect(response).to render_template(:show)
      end
    end
  end

  describe "GET #edit" do
    context "when user is logged in" do
      it "responds with status code 200" do
        get :edit, params: { id: student.id }
        expect(response).to have_http_status 200
      end

      it "assigns the correct student as @student" do
        get :edit, params: { id: student.id }
        expect(assigns(:student)).to eq(student)
      end

      it "renders the :edit template" do
        get :edit, params: { id: student.id }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "PATCH #update" do
    context "when user is logged in" do
      it "responds with status code 302" do
        put :update, params: { student: { first_name: 'Quynh', last_name: 'Nguyen', grade_level: 12, gender: 'female', gpa: 4.40, detentions: 0, shirt_size: 'small' }, id: student.id }
        expect(response).to have_http_status 302
      end

      it "assigns the correct student as @student" do
        put :update, params: { student: { first_name: 'Quynh', last_name: 'Nguyen', grade_level: 12, gender: 'female', gpa: 4.40, detentions: 0, shirt_size: 'small' }, id: student.id }
        student.reload

        expect(student.gpa).to eq(4.40)
      end
    end
  end

  describe "PATCH #assign" do
    before do
      session[:teacher_id] = teacher.id
      patch :assign, params: { id: student.id }
    end

    context "when a user is logged in" do
      it "responds with status code 302" do
        expect(response).to have_http_status 302
      end

      it "assigns teacher to student" do
        student.reload

        expect(student.teacher).to eq teacher
      end

      it "sends a notice if student is already assigned" do
        student.update(teacher_id: teacher.id)
        patch :assign, params: { id: student.id }

        expect(flash[:notice]).to eq("This student has already been assigned.")
      end
    end

    context "when a user is not logged in" do
      it "responds with status code 302" do
        session[:teacher_id] = nil
        patch :assign, params: { id: student.id }

        expect(response).to have_http_status 302
      end

      it "redirects to the root page" do
        session[:teacher_id] = nil
        patch :assign, params: { id: student.id }

        expect(response).to redirect_to root_path
      end
    end
  end

end
