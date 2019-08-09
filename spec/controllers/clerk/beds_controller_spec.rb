require 'rails_helper'

RSpec.describe Clerk::BedsController, type: :controller do
  let(:department) {
    Department.create(name: 'cardiology')
  }


  let(:ward) {
    Ward.create(wards_name: 'A', department_id: department.id)
  }

  let(:valid_attributes) {
    {beds: '10', ward_id: ward.id}
    # skip(" ")
  }

  let(:invalid_attributes) {
     skip("Add a hash of attributes invalid for your model")
  
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # bedsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Bed.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end




  describe "GET #show" do
    it "returns a success response" do
      bed = Bed.create! valid_attributes
      get :show, params: {id: bed.to_param}, session: valid_session
      expect(response).to be_successful
    end
     it "returns a success response" do
      bed = Bed.create! valid_attributes
      get :show, params: {id: bed.to_param}, session: valid_session
      expect(bed.id).to be_between(1,5)
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
      bed = Bed.create! valid_attributes
      get :edit, params: {id: bed.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new bed" do
        expect {
          post :create, params: {bed: valid_attributes}, session: valid_session
        }.to change(Bed, :count).by(1)
      end

      it "redirects to the created bed" do
        post :create, params: {bed: valid_attributes}, session: valid_session
        expect(response).to redirect_to clerk_beds_path
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {bed: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested bed" do
        bed = Bed.create! valid_attributes
        put :update, params: {id: bed.to_param, bed: new_attributes}, session: valid_session
        bed.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the bed" do
        bed = Bed.create! valid_attributes
        put :update, params: {id: bed.to_param, bed: valid_attributes}, session: valid_session
        expect(response).to redirect_to clerk_beds_path
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        bed = Bed.create! valid_attributes
        put :update, params: {id: bed.to_param, bed: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested bed" do
      bed = Bed.create! valid_attributes
      expect {
        delete :destroy, params: {id: bed.to_param}, session: valid_session
      }.to change(Bed, :count).by(-1)
    end

    it "redirects to the beds list" do
      bed = Bed.create! valid_attributes
      delete :destroy, params: {id: bed.to_param}, session: valid_session
      expect(response).to redirect_to clerk_beds_path
    end
  end




end
