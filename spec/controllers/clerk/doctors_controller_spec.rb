require 'rails_helper'

RSpec.describe Clerk::DoctorsController, type: :controller do

  let(:department) {
    Department.create(name: 'cardiology')
  }

  let(:valid_attributes) {
    {name: 'dr.asif', spec: 'heart' ,hours: Time.now+1 , fees: '1000',
    department_id: department.id ,
    email: 'abc22@doctor.com', password: '111111',password_confirmation: '111111'}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
    {}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # doctorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  login_clerk
  describe "GET #index" do
    it "returns a success response" do
      Doctor.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      doctor = Doctor.create! valid_attributes
      get :show, params: {id: doctor.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      doctor = Doctor.create! valid_attributes
      get :edit, params: {id: doctor.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
      context "with valid params" do
        it "creates a new doctor" do
          expect {
            post :create, params: {doctor: valid_attributes}, session: valid_session
          }.to change(Doctor, :count).by(1)
        end

        it "redirects to the created doctor" do
          post :create, params: {doctor: valid_attributes}, session: valid_session
          expect(response).to redirect_to clerk_doctors_path
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {doctor: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested doctor" do
        doctor = Doctor.create! valid_attributes
        put :update, params: {id: doctor.to_param, doctor: new_attributes}, session: valid_session
        doctor.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the doctor" do
        doctor = Doctor.create! valid_attributes
        put :update, params: {id: doctor.to_param, doctor: valid_attributes}, session: valid_session
        expect(response).to redirect_to  clerk_doctors_path
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        doctor = Doctor.create! valid_attributes
        put :update, params: {id: doctor.to_param, doctor: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
      it "destroys the requested doctor" do
        doctor = Doctor.create! valid_attributes
        expect {
          delete :destroy, params: {id: doctor.to_param}, session: valid_session
        }.to change(Doctor, :count).by(-1)
      end

      it "redirects to the doctors list" do
        doctor = Doctor.create! valid_attributes
        delete :destroy, params: {id: doctor.to_param}, session: valid_session
        expect(response).to redirect_to  clerk_doctors_path
    end
  end
end
