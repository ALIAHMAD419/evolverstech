class Clerk::WardsController < ApplicationController
  before_action :authenticate_clerk!
  def index
    @ward = Ward.all
  end

  # GET /wards/1
  # GET /wards/1.json
  def show
    @ward= Ward.find(params[:id])   

  end

  # GET /wards/new
  def new
    @ward = Ward.new
  end

  # GET /wards/1/edit
  def edit
    @ward = Ward.find(params[:id])
  end

  # POST /wards
  # POST /wards.json
  def create
    @ward = Ward.new(ward_params)

    respond_to do |format|
      if @ward.save
        format.html { redirect_to clerk_wards_path, notice: 'ward was successfully created.' }
        format.json { render :show, status: :created, location: @ward }
      else
        format.html { render :new }
        format.json { render json: @ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wards/1
  # PATCH/PUT /wards/1.json
  def update
        @ward = Ward.find(params[:id])

    respond_to do |format|
      if @ward.update(ward_params)
        format.html { redirect_to clerk_wards_path, notice: 'ward was successfully updated.' }
        format.json { render :show, status: :ok, location: @ward }
      else
        format.html { render :edit }
        format.json { render json: @ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wards/1
  # DELETE /wards/1.json
  def destroy
        @ward = Ward.find(params[:id])

    @ward.destroy
    respond_to do |format|
      format.html { redirect_to clerk_wards_path, notice: 'ward was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ward
      @ward = Ward.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ward_params
      params.require(:ward).permit(:wards_name,:department_id)
    end

end
