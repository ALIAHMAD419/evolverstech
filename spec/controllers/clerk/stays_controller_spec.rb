require 'rails_helper'

RSpec.describe Clerk::StaysController, type: :controller do
  let(:department) {
    Department.create(name: 'cardiology')
  }
  let(:doctor) {
    Doctor.create(name: 'dr.asif', spec: 'heart' ,hours: Time.now+1 , fees: '1000' ,department_id: department.id)
  }

  let(:patient) {
    Patient.create(name: 'kashif', age: '20', weight: '80', dis: 'heart', phone: '03314189843', 
      address: 'johartown',department_id: department.id)
  }
  let(:ward) {
    Ward.create(wards_name: 'A',department_id: department.id)
    }
  let(:valid_attributes) {
    {a_time: Time.now+1 ,d_time: Time.now+3 , patient_id: patient.id, doctor_id: doctor.id, ward_id: ward.id}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # staysController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Stay.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      stay = Stay.create! valid_attributes
      get :show, params: {id: stay.to_param}, session: valid_session
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
      stay = Stay.create! valid_attributes
      get :edit, params: {id: stay.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
      context "with valid params" do
        it "creates a new stay" do
          expect {
            post :create, params: {stay: valid_attributes}, session: valid_session
          }.to change(Stay, :count).by(1)
        end

        it "redirects to the created stay" do
          post :create, params: {stay: valid_attributes}, session: valid_session
          expect(response).to redirect_to clerk_stays_path
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {stay: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested stay" do
        stay = Stay.create! valid_attributes
        put :update, params: {id: stay.to_param, stay: new_attributes}, session: valid_session
        stay.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the stay" do
        stay = Stay.create! valid_attributes
        put :update, params: {id: stay.to_param, stay: valid_attributes}, session: valid_session
        expect(response).to redirect_to  clerk_stays_path
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        stay = Stay.create! valid_attributes
        put :update, params: {id: stay.to_param, stay: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
      it "destroys the requested stay" do
        stay = Stay.create! valid_attributes
        expect {
          delete :destroy, params: {id: stay.to_param}, session: valid_session
        }.to change(Stay, :count).by(-1)
      end

      it "redirects to the stays list" do
        stay = Stay.create! valid_attributes
        delete :destroy, params: {id: stay.to_param}, session: valid_session
        expect(response).to redirect_to  clerk_stays_path
    end
  end


end
