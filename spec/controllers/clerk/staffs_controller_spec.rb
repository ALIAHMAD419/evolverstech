require 'rails_helper'

RSpec.describe Clerk::StaffsController, type: :controller do
  let(:department) {
    Department.create(name: 'cardiology')
  }
  let(:ward) {
    Ward.create(wards_name: 'A',department_id: department.id)
  }
  let(:valid_attributes) {
    {name: 'ahmad',time: Time.now+1,age: '22',duty: 'nursing',floor: 'first', ward_id: ward.id }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # staffsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  login_clerk
  describe "GET #index" do
    it "returns a success response" do
      Staff.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      staff = Staff.create! valid_attributes
      get :show, params: {id: staff.to_param}, session: valid_session
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
      staff = Staff.create! valid_attributes
      get :edit, params: {id: staff.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
      context "with valid params" do
        it "creates a new staff" do
          expect {
            post :create, params: {staff: valid_attributes}, session: valid_session
          }.to change(Staff, :count).by(1)
        end

        it "redirects to the created staff" do
          post :create, params: {staff: valid_attributes}, session: valid_session
          expect(response).to redirect_to clerk_staffs_path
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {staff: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested staff" do
        staff = Staff.create! valid_attributes
        put :update, params: {id: staff.to_param, staff: new_attributes}, session: valid_session
        staff.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the staff" do
        staff = Staff.create! valid_attributes
        put :update, params: {id: staff.to_param, staff: valid_attributes}, session: valid_session
        expect(response).to redirect_to  clerk_staffs_path
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        staff = Staff.create! valid_attributes
        put :update, params: {id: staff.to_param, staff: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
      it "destroys the requested staff" do
        staff = Staff.create! valid_attributes
        expect {
          delete :destroy, params: {id: staff.to_param}, session: valid_session
        }.to change(Staff, :count).by(-1)
      end

      it "redirects to the staffs list" do
        staff = Staff.create! valid_attributes
        delete :destroy, params: {id: staff.to_param}, session: valid_session
        expect(response).to redirect_to  clerk_staffs_path
    end
  end

end
