class Api::V2::MotorcylesController < ApplicationController
  before_action :authorize, only: %i[create update destroy]
  before_action :set_motorcycle, only: %i[create update destroy]

  def index
    @motorcycles = Motorcycle.all
    render json: @motorcycles
  end

  def show
    @motorcycle = Motorcycle.find(params[:id])
    render json: @motorcycle
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_params.merge(user: @user))
    if @motorcycle.save
      render json: { success: true, message: "Motorcycle created successfully", motorcycle: @motorcycle },
             status: :created
    else
      render json: { success: false, message: "Motorcycle not created", errors: @motorcycle.errors },
             status: :bad_request
    end
  end

  def update
    # @motorcycle = Motorcycle.find(params[:id])
    if @motorcycle.update(motorcycle_params)
      render json: { success: true, message: "Motorcycle updated successfully", motorcycle: @motorcycle },
             status: :ok
    else
      render json: { success: false, message: "Motorcycle not updated", errors: @motorcycle.errors },
             status: :bad_request
    end
  end

  def destroy
    # @motorcycle = Motorcycle.find(params[:id])
    if @motorcycle.destroy
      render json: { success: true, message: "Motorcycle deleted successfully" }, status: :ok
    else
      render json: { success: false, message: "Motorcycle not deleted" }, status: :bad_request
    end
  end

  private

  def set_motorcycle
    @motorcycle = @user.motorcycles.find(params[:id])
  end

  def motorcycle_params
    params.permit(:title, :year, :model, :color, :description, :image)
  end
end
