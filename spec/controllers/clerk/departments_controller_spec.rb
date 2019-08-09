require 'rails_helper'

RSpec.describe Clerk::DepartmentsController, type: :controller do



  let(:valid_attributes) {
    {name: 'CARDIOLOGY'}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
    {}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # departmentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Department.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end




  describe "GET #show" do
    it "returns a success response" do
      department = Department.create! valid_attributes
      get :show, params: {id: department.to_param}, session: valid_session
      expect(response).to be_successful
    end
     it "returns a success response" do
      department = Department.create! valid_attributes
      get :show, params: {id: department.to_param}, session: valid_session
      expect(department.id).to be_between(1,5)
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
      department = Department.create! valid_attributes
      get :edit, params: {id: department.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new department" do
        expect {
          post :create, params: {department: valid_attributes}, session: valid_session
        }.to change(Department, :count).by(1)
      end

      it "redirects to the created department" do
        post :create, params: {department: valid_attributes}, session: valid_session
        expect(response).to redirect_to clerk_departments_path
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {department: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested department" do
        department = Department.create! valid_attributes
        put :update, params: {id: department.to_param, department: new_attributes}, session: valid_session
        department.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the department" do
        department = Department.create! valid_attributes
        put :update, params: {id: department.to_param, department: valid_attributes}, session: valid_session
        expect(response).to redirect_to clerk_departments_path
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        department = Department.create! valid_attributes
        put :update, params: {id: department.to_param, department: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested department" do
      department = Department.create! valid_attributes
      expect {
        delete :destroy, params: {id: department.to_param}, session: valid_session
      }.to change(Department, :count).by(-1)
    end

    it "redirects to the departments list" do
      department = Department.create! valid_attributes
      delete :destroy, params: {id: department.to_param}, session: valid_session
      expect(response).to redirect_to clerk_departments_path
    end
  end





end
