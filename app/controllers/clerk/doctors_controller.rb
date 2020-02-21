class Clerk::DoctorsController < ApplicationController
  before_action :authenticate_clerk!
  
  def index
    @doctor = Doctor.all
  end

  def show
    @doctor=Doctor.find(params[:id])   

  end

  def new
    @doctor = Doctor.new
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to clerk_doctors_path
    else
      render :new
    end
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to clerk_doctors_path
    else
      render :edit
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to clerk_doctors_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:name,:spec,:hours,:email,:department_id,:fees,:ward,:password,:password_confirmation)
    end

end
