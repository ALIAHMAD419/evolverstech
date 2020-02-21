class Clerk::AppointmentsController < ApplicationController
  before_action :authenticate_clerk!
  
  def index
    @appointment = Appointment.all
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    times = check_appointment_times(@appointment.doctor_id, @appointment.start_time)
    if times.zero?
      if @appointment.save
        redirect_to clerk_appointments_path
      else
        render :new
      end
    else
      redirect_to new_clerk_appointment_path
      flash[:error] = "appointment of the doctor is already booked"
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to clerk_appointments_path
    else
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to clerk_appointments_path
  end

  private

    def check_appointment_times(doctor_id, start_time)
      Appointment.where(doctor_id: doctor_id)
      .where('start_time <= ? AND end_time >= ?', start_time, start_time)
      .count
    end
    # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :doctor_id, :patient_id, :room_id)
  end
end
