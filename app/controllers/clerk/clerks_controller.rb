class Clerk::ClerksController < ApplicationController
#before_action :set_clerk, only: [:show, :edit, :update, :destroy]
  # GET /clerks
  # GET /clerks.json
  before_action :authenticate_clerk!
  def index
    @clerk = Clerk.all
  end

  # GET /clerks/1
  # GET /clerks/1.json
  def show
      @clerk=Clerk.find(params[:id])   
  end

  # GET /clerks/new
  def new
    @clerk = Clerk.new
  end

  # GET /clerks/1/edit
  def edit
      @clerk=Clerk.find(params[:id])   
  end

  # POST /clerks
  # POST /clerks.json
  def create
    @clerk = Clerk.new(clerk_params)

    respond_to do |format|
      if @clerk.save
        format.html { redirect_to clerk_clerks_path, notice: 'Clerk was successfully created.' }
        format.json { render :show, status: :created, location: @clerk }
      else
        format.html { render :new }
        format.json { render json: @clerk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clerks/1
  # PATCH/PUT /clerks/1.json
  

  def update
      @clerk=Clerk.find(params[:id])   
    respond_to do |format|
      if @clerk.update(clerk_params)
        # redirect_to @clerk
        format.html { redirect_to clerk_clerks_path, notice: 'Clerk was successfully updated.' }
        format.json { render :show, status: :ok, location: @clerk }
      else
        format.html { render :edit }
        format.json { render json: @clerk.errors, status: :unprocessable_entity }
       end
    end
  end

  # DELETE /clerks/1
  # DELETE /clerks/1.json
  def destroy
      @clerk=Clerk.find(params[:id])   
      # @clerk.destroy
 
      # redirect_to clerks_path


    @clerk.destroy
    respond_to do |format|
      format.html { redirect_to clerk_clerks_path, notice: 'Clerk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clerk
      @clerk = Clerk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clerk_params
      # params.fetch(:clerk, {})
      params.require(:clerk).permit(:name,:time,:age,:email,:password,:password_confirmation)
    end

end
