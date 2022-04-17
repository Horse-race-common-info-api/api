class HorsesController < ApplicationController
  def show
    render json: Horse.find(params[:id]), status: :ok
  end
end
