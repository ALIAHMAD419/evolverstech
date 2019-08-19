require 'rails_helper'

RSpec.describe Clerk::PatientsController, type: :controller do

  let(:department) {
    Department.create(name: 'cardiology')
  }

  let(:valid_attributes) {
    {name: 'kashif', age: '20', weight: '80', dis: 'heart', phone: '03314189843', 
      address: 'johartown',department_id: department.id,
      email: 'abc22@patient.com', password: '111111',password_confirmation: '111111'}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
    {}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PatientsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  login_clerk
  describe "GET #index" do
    it "returns a success response" do
      Patient.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      patient = Patient.create! valid_attributes
      get :show, params: {id: patient.to_param}, session: valid_session
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
      patient = Patient.create! valid_attributes
      get :edit, params: {id: patient.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
      context "with valid params" do
        it "creates a new Patient" do
          expect {
            post :create, params: {patient: valid_attributes}, session: valid_session
          }.to change(Patient, :count).by(1)
        end

        it "redirects to the created Patient" do
          post :create, params: {patient: valid_attributes}, session: valid_session
          expect(response).to redirect_to clerk_patients_path
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {patient: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested Patient" do
        patient = Patient.create! valid_attributes
        put :update, params: {id: patient.to_param, patient: new_attributes}, session: valid_session
        Patient.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the Patient" do
        patient = Patient.create! valid_attributes
        put :update, params: {id: patient.to_param, patient: valid_attributes}, session: valid_session
        expect(response).to redirect_to  clerk_patients_path
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        patient = Patient.create! valid_attributes
        put :update, params: {id: patient.to_param, patient: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
      it "destroys the requested Patient" do
        patient = Patient.create! valid_attributes
        expect {
          delete :destroy, params: {id: patient.to_param}, session: valid_session
        }.to change(Patient, :count).by(-1)
      end

      it "redirects to the Patients list" do
        patient = Patient.create! valid_attributes
        delete :destroy, params: {id: patient.to_param}, session: valid_session
        expect(response).to redirect_to  clerk_patients_path
    end
  end

end
