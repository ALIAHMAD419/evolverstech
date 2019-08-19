class Clerk::StaysController < ApplicationController
  before_action :authenticate_clerk!
  def np
    @stay = Stay.new 
  end

  def index
    @stay = Stay.all
  end

  # GET /stays/1
  # GET /stays/1.json
  def show
    @stay = Stay.find(params[:id])
  end

  # GET /stays/new
  def new
    @stay = Stay.new
    @patient = @stay.build_patient
  end

  # GET /stays/1/edit
  def edit
    @stay = Stay.find(params[:id])
  end
 
  # POST /stays
  # POST /stays.json
  def create
    @stay = Stay.new(new_patient)
    # debugger

    respond_to do |format|
      if @stay.save
        format.html { redirect_to clerk_stays_path, notice: 'stay was successfully created.' }
        format.json { render :show, status: :created, location: @stay }
      elsif params[:commit] == "save patient & stay"
        format.html { render :new }
        format.json { render json: @stay.errors, status: :unprocessable_entity }
      else
                format.html { render :np }
      end
    end
  end

  # PATCH/PUT /stays/1
  # PATCH/PUT /stays/1.json
  def update
    @stay = Stay.find(params[:id])
    respond_to do |format|
      if @stay.update(new_patient)
        format.html { redirect_to clerk_stays_path, notice: 'stay was successfully updated.' }
        format.json { render :show, status: :ok, location: @stay }
      else
        format.html { render :edit }
        format.json { render json: @stay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stays/1
  # DELETE /stays/1.json
  def destroy
    @stay = Stay.find(params[:id])
    @stay.destroy
    respond_to do |format|
      format.html { redirect_to clerk_stays_path, notice: 'stay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stay
      @stay = stay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_patient
      params.require(:stay).permit(:patient_id,:ward_id,:doctor_id,:bed,:a_time,:d_time,:commit, :patient_attributes => [:name,:age,:weight,:dis,:department_id,:ward_id,:phone,:address,:email,:password,:password_confirmation])
    end
end
