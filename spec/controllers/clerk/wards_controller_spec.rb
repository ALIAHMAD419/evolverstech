require 'rails_helper'

RSpec.describe Clerk::WardsController, type: :controller do
  
  let(:department) {
    Department.create(name: 'cardiology')
  }
  
  let(:valid_attributes) {
    {wards_name: 'A',department_id: department.id}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
    {}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # wardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Ward.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      ward = Ward.create! valid_attributes
      get :show, params: {id: ward.to_param}, session: valid_session
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
      ward = Ward.create! valid_attributes
      get :edit, params: {id: ward.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
      context "with valid params" do
        it "creates a new ward" do
          expect {
            post :create, params: {ward: valid_attributes}, session: valid_session
          }.to change(Ward, :count).by(1)
        end

        it "redirects to the created ward" do
          post :create, params: {ward: valid_attributes}, session: valid_session
          expect(response).to redirect_to clerk_wards_path
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {ward: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested ward" do
        ward = Ward.create! valid_attributes
        put :update, params: {id: ward.to_param, ward: new_attributes}, session: valid_session
        ward.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the ward" do
        ward = Ward.create! valid_attributes
        put :update, params: {id: ward.to_param, ward: valid_attributes}, session: valid_session
        expect(response).to redirect_to  clerk_wards_path
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        ward = Ward.create! valid_attributes
        put :update, params: {id: ward.to_param, ward: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
      it "destroys the requested ward" do
        ward = Ward.create! valid_attributes
        expect {
          delete :destroy, params: {id: ward.to_param}, session: valid_session
        }.to change(Ward, :count).by(-1)
      end

      it "redirects to the wards list" do
        ward = Ward.create! valid_attributes
        delete :destroy, params: {id: ward.to_param}, session: valid_session
        expect(response).to redirect_to  clerk_wards_path
    end
  end

end
