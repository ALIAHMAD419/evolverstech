class Clerk::BedsController < ApplicationController
  before_action :authenticate_clerk!
  def index
      @bed = Bed.all
    end

  # GET /beds/1
  # GET /beds/1.json
  def show
    @bed= Bed.find(params[:id])   

  end

  # GET /beds/new
  def new
    @bed = Bed.new
  end

  # GET /beds/1/edit
  def edit
    @bed = Bed.find(params[:id])
  end

  # POST /beds
  # POST /beds.json
  def create
    @bed = Bed.new(bed_params)

    respond_to do |format|
      if @bed.save
        format.html { redirect_to clerk_beds_path, notice: 'bed was successfully created.' }
        format.json { render :show, status: :created, location: @bed }
      else
        format.html { render :new }
        format.json { render json: @bed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beds/1
  # PATCH/PUT /beds/1.json
  def update
        @bed = Bed.find(params[:id])

    respond_to do |format|
      if @bed.update(bed_params)
        format.html { redirect_to clerk_beds_path, notice: 'bed was successfully updated.' }
        format.json { render :show, status: :ok, location: @bed }
      else
        format.html { render :edit }
        format.json { render json: @bed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beds/1
  # DELETE /beds/1.json
  def destroy
        @bed = Bed.find(params[:id])

    @bed.destroy
    respond_to do |format|
      format.html { redirect_to clerk_beds_path, notice: 'bed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bed
      @bed = Bed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bed_params
      params.require(:bed).permit(:beds,:ward_id)
    end



end
