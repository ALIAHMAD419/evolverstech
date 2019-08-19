class Clerk::DepartmentsController < ApplicationController
  before_action :authenticate_clerk!
  def index
    @department = Department.all  
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @department=Department.find(params[:id])   

  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
    @department = Department.find(params[:id])
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to clerk_departments_path, notice: 'department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
        @department = Department.find(params[:id])

    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to clerk_departments_path, notice: 'department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
        @department = Department.find(params[:id])

    @department.destroy
    respond_to do |format|
      format.html { redirect_to clerk_departments_path, notice: 'department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:name,:ward_id)
    end



end
