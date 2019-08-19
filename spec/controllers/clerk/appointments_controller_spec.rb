require 'rails_helper'

RSpec.describe Clerk::AppointmentsController, type: :controller do

  # doctor_attributes (name: '' ,spec: '' ,hours: '' ,fee: '')
  # patient_attributes { {name: '',age: '',weight: '',dis: '',phone: '',address: '' } }
  let(:department) {
    Department.create(name: 'cardiology')
  }

  let(:doctor) {
    Doctor.create(name: 'dr.asif', spec: 'heart' ,hours: Time.now+1 , fees: '1000',
      department_id: department.id , 
      email: 'abc22@doctor.com', password: '111111',password_confirmation: '111111')
  }
  
  let(:room) {
    Room.create(room: '001F')
  }
  
  let(:patient) {
    Patient.create(name: 'kashif', age: '20', weight: '80', dis: 'heart', phone: '03314189843', 
      address: 'johartown',department_id: department.id , 
      email: 'abc22@patient.com', password: '111111',password_confirmation: '111111')
  }

  let(:valid_attributes) {
      {start_time: Time.now + 1 ,end_time: Time.now+2, room_id: room.id, 
        doctor_id: doctor.id, patient_id: patient.id}
    }

    let(:invalid_attributes) {
      {start_time: Time.now + 1 ,end_time: Time.now+2, room_id: room.id, 
        doctor_id: nil , patient_id: nil}
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # appointmentsController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    login_clerk
    
    # describe "GET #index" do
    #   it "returns a success response" , create: true do
    #     appointment = Appointment.new valid_attributes
    #     appointment.doctor = doctor
    #     appointment.patient = patient
    #     appointment.save
    #     get :index
    #     expect(response).to be_successful
    #   end
    # end   
    describe "GET #index" do
      it "returns a success response"  do
        Appointment.create! valid_attributes
         get :index, params: {}, session: valid_session
      expect(response).to be_successful
      end
    end

    describe "GET #show" do
      it "returns a success response" do
        appointment=Appointment.create! valid_attributes
        get :show, params: {id: appointment.to_param}, session: valid_session
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
       appointment=Appointment.create! valid_attributes
        get :edit, params: {id: appointment.to_param}, session: valid_session
        expect(response).to be_successful
      end
    end

    describe "POST #create" do
        context "with valid params" do
          it "creates a new appointment" do
            expect {
              post :create, params: {appointment: valid_attributes}, session: valid_session
            }.to change(Appointment, :count).by(1)

          end

          it "redirects to the created appointment" do
            post :create, params: {appointment: valid_attributes}, session: valid_session
            expect(response).to redirect_to clerk_appointments_path
          end
        end

        context "with invalid params" do
          it "returns a success response (i.e. to display the 'new' template)" do
            post :create, params: {appointment: invalid_attributes}, session: valid_session
            expect(response).to be_successful
          end
        end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }

        it "updates the requested appointment" do
          appointment = Appointment.create! valid_attributes
          put :update, params: {id: appointment.to_param, appointment: new_attributes}, session: valid_session
          appointment.reload
          skip("Add assertions for updated state")
        end

        it "redirects to the appointment" do
          appointment = Appointment.create! valid_attributes
          put :update, params: {id: appointment.to_param, appointment: valid_attributes}, session: valid_session
          expect(response).to redirect_to  clerk_appointments_path
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          appointment = Appointment.create! valid_attributes
          put :update, params: {id: appointment.to_param, appointment: invalid_attributes}, session: valid_session
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
        it "destroys the requested appointment" do
          appointment = Appointment.create! valid_attributes
          expect {
            delete :destroy, params: {id: appointment.to_param}, session: valid_session
          }.to change(Appointment, :count).by(-1)
        end

        it "redirects to the appointments list" do
          appointment = Appointment.create! valid_attributes
          delete :destroy, params: {id: appointment.to_param}, session: valid_session
          expect(response).to redirect_to  clerk_appointments_path
      end
    end
   

end
