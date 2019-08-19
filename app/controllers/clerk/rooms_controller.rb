class Clerk::RoomsController < ApplicationController
  before_action :authenticate_clerk!
  def index
    @room = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room= Room.find(params[:id])   

  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to clerk_rooms_path, notice: 'room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
        @room = Room.find(params[:id])

    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to clerk_rooms_path, notice: 'room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
        @room = Room.find(params[:id])

    @room.destroy
    respond_to do |format|
      format.html { redirect_to clerk_rooms_path, notice: 'room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:room)
    end
end
