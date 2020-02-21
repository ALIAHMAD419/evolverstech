# frozen_string_literal: true

class Clerk::ClerksController < ApplicationController
  before_action :set_clerk, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_clerk!
  def index
    @clerk = Clerk.all
  end

  def show
    @clerk = Clerk.find(params[:id])
  end

  def new
    @clerk = Clerk.new
  end

  def edit
    @clerk = Clerk.find(params[:id])
  end

  def create
    @clerk = Clerk.new(clerk_params)
    if @clerk.save
      redirect_to clerk_clerks_path
    else
      render :new 
    end
  end

  def update
    @clerk = Clerk.find(params[:id])    
    if @clerk.update(clerk_params)
      redirect_to clerk_clerks_path
    else
      render :edit
    end
  end

  def destroy
    @clerk=Clerk.find(params[:id])   
    if current_clerk != @clerk
      @clerk.destroy
    else
      flash[:error] = "you can't delete your own record"
    end
    redirect_to clerk_clerks_path
  end

  private

  def set_clerk
    @clerk = Clerk.find(params[:id])
  end

  def clerk_params
    params.require(:clerk).permit(:name, :time, :age, :email, :password, :password_confirmation)
  end
end
