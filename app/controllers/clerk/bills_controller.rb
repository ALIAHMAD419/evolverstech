class Clerk::BillsController < ApplicationController
  before_action :authenticate_clerk!

  def index
     @bill = Bill.all
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
    @bill= Bill.find(params[:id])   

  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
    @bill = Bill.find(params[:id])
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to clerk_bills_path, notice: 'bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
        @bill = Bill.find(params[:id])

    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to clerk_bills_path, notice: 'bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
      @bill = Bill.find(params[:id])

    @bill.destroy
    respond_to do |format|
      format.html { redirect_to clerk_bills_path, notice: 'bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:bill,:stay_id)
    end



end
