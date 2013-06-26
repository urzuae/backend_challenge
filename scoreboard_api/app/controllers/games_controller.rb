class GamesController < ApplicationController
  def create
    @playerA = User.find(params[:playerA])
    render json: @playerA
  end
  
  def score
    
  end
  
  def reset_point
    
  end
  
  def show
  end
  
  def end
    
  end
end
