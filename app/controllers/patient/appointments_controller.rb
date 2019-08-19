class Patient::AppointmentsController < ApplicationController
  before_action :authenticate_patient!
  def index
      # debugger
      # @appointment = Appointment.all   
      @appointment = Appointment.where(patient_id: current_patient.id)   
    end
  def show
    @appointment =Appointment.find(params[:id])
  end
end
