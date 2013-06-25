class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end
  
  def create
    @user = User.new({:name => params[:name], :wins_count => 0, :loses_count => 0})
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user
  end
end