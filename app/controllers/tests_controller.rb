class TestsController < ApplicationController
  def index
    render json: { message: 'test' }, status: :ok
  end
end