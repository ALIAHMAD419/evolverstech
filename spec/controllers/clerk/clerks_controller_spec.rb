require 'rails_helper'

RSpec.describe Clerk::ClerksController, type: :controller do
  

  let(:valid_attributes) {
    {name: 'ali', time: Time.now+5, age: '22'}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
    {}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # clerksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Clerk.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
    it "check clerk id is between (1 to 5)" do
      clerk=Clerk.create! valid_attributes
      get :index, params: {},session: valid_session
      expect(clerk.id).to be_between(1,5) 
    end
    it "id equals to its name " do
        clerk=Clerk.create! valid_attributes
        clerk.name='ahmad'
        clerk.save
        get :index, params: {},session: valid_session
        expect(clerk.name).to eql "ahmad" 

    end
 
  end




  describe "GET #show" do
    it "returns a success response" do
      clerk = Clerk.create! valid_attributes
      get :show, params: {id: clerk.to_param}, session: valid_session
      expect(response).to be_successful
    end
     it "returns a success response" do
      clerk = Clerk.create! valid_attributes
      get :show, params: {id: clerk.to_param}, session: valid_session
      expect(clerk.id).to be_between(1,5)
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
      clerk = Clerk.create! valid_attributes
      get :edit, params: {id: clerk.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new clerk" do
        expect {
          post :create, params: {clerk: valid_attributes}, session: valid_session
        }.to change(Clerk, :count).by(1)
      end

      it "redirects to the created clerk" do
        post :create, params: {clerk: valid_attributes}, session: valid_session
        expect(response).to redirect_to clerk_clerks_path
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {clerk: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested clerk" do
        clerk = Clerk.create! valid_attributes
        put :update, params: {id: clerk.to_param, clerk: new_attributes}, session: valid_session
        clerk.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the clerk" do
        clerk = Clerk.create! valid_attributes
        put :update, params: {id: clerk.to_param, clerk: valid_attributes}, session: valid_session
        expect(response).to redirect_to clerk_clerks_path
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        clerk = Clerk.create! valid_attributes
        put :update, params: {id: clerk.to_param, clerk: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested clerk" do
      clerk = Clerk.create! valid_attributes
      expect {
        delete :destroy, params: {id: clerk.to_param}, session: valid_session
      }.to change(Clerk, :count).by(-1)
    end

    it "redirects to the clerks list" do
      clerk = Clerk.create! valid_attributes
      delete :destroy, params: {id: clerk.to_param}, session: valid_session
      expect(response).to redirect_to clerk_clerks_path
    end
  end





end
