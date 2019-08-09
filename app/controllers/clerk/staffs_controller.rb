class Clerk::StaffsController < ApplicationController
def index
    @staff = Staff.all
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
      @staff=Staff.find(params[:id])   
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
      @staff=Staff.find(params[:id])   
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to clerk_staffs_path, notice: 'staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  

  def update
      @staff=Staff.find(params[:id])   
    respond_to do |format|
      if @staff.update(staff_params)
        # redirect_to @staff
        format.html { redirect_to clerk_staffs_path, notice: 'staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
       end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
      @staff=Staff.find(params[:id])   
      # @staff.destroy
 
      # redirect_to staffs_path


    @staff.destroy
    respond_to do |format|
      format.html { redirect_to clerk_staffs_path, notice: 'staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = staff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staff_params
      # params.fetch(:staff, {})
      params.require(:staff).permit(:name,:time,:age,:duty,:floor,:department_id,:ward_id)
    end




end
