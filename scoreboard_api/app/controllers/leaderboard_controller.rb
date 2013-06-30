class LeaderboardController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end
end
