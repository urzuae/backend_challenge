class UsersController < ApplicationController
  
  def create
    @user = User.new({:name => params[:name]})
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attribute(:name, params[:name])
    render json: @user
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    head :no_content
  end
end