class Doctor::AppointmentsController < ApplicationController
    before_action :authenticate_doctor!
  def index
    @appointment = Appointment.all
      # debugger
    if params[:search] == ""
        @appointment = Appointment.where(doctor_id: current_doctor.id)
    elsif params[:search] == "7 days"
      @appointment = Appointment.where(doctor_id: current_doctor.id)
      .where(Appointment.arel_table[:start_time].gteq(Date.today)
        .and(Appointment.arel_table[:end_time].lteq(Date.today+7)))            
    elsif params[:search] == "14 days"  
       # @appointment = Appointment.all
        @appointment = Appointment.where(doctor_id: current_doctor.id)
        .where(Appointment.arel_table[:start_time].gteq(Date.today)
        .and(Appointment.arel_table[:end_time].lteq(Date.today+14)))
    elsif params[:search] == "1 month"  
        @appointment = Appointment.where(doctor_id: current_doctor.id)
      .where(Appointment.arel_table[:start_time].gteq(Date.today)
        .and(Appointment.arel_table[:end_time].lteq(Date.today+30)))
    else  
        @appointment = Appointment.where(doctor_id: current_doctor.id)
    end

  end

  def show
    @appointment =Appointment.find(params[:id])
  end


end
