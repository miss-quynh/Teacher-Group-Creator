require 'rails_helper'

describe SessionsController do
  describe "POST #create" do
    let(:teacher) { Teacher.create(first_name: 'Dillon', last_name: 'Nguyen', email: 'dillon@gmail.com', password: 'dillondillon') }

    after do
      teacher.destroy
    end

    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, params: { session: { email: teacher.email, password: 'dillondillon'} }

        expect(response).to have_http_status 302
      end

      it "creates a user session" do
        post :create, params: { session: { email: teacher.email, password: teacher.password} }

        expect(session[:teacher_id]).to eq teacher.id
      end

      it "sets a notice that login is successful" do
        post :create, params: { session: { email: teacher.email, password: teacher.password} }

        expect(flash[:notice]).to eq("Successfully logged in.")
      end
    end

    context "when invalid params are passed" do
      it "sets a notice that the input is invalid" do
        post :create, params: { session: { email: teacher.email, password: 'invalid'} }

        expect(flash[:notice]).to eq("Invalid email or password.")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:teacher) { Teacher.create(first_name: 'Dillon', last_name: 'Nguyen', email: 'dillon@gmail.com', password: 'dillondillon') }

    context "when user is logged in" do
      it "destroys user session" do
        post :create, params: { session: { email: teacher.email, password: teacher.password} }
        expect(session[:teacher_id]).not_to be_nil

        delete :destroy

        expect(session[:teacher_id]).to be_nil
      end
    end
  end

end