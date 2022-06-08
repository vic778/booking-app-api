class Api::V2::MotorcylesController < ApplicationController
  before_action :authorize, only: %i[create update destroy]
  before_action :set_motorcycle, only: %i[update]

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
      render json: { success: true, message: "Scooter created successfully", motorcycle: @motorcycle },
             status: :created
    else
      render json: { success: false, message: "Scooter not created", errors: @motorcycle.errors },
             status: :bad_request
    end
  end

  def update
    if @motorcycle.update(motorcycle_params)
      render json: { success: true, message: "Scooter updated successfully", motorcycle: @motorcycle },
             status: :ok
    else
      render json: { success: false, message: "Scooter not updated", errors: @motorcycle.errors },
             status: :bad_request
    end
  end

  def destroy
    if @motorcycle = @user.motorcycles.find(params[:id])
      if @motorcycle.available == true
        @motorcycle.destroy
        render json: { success: true, message: "Scooter deleted successfully" }, status: :ok
      else
        render json: { success: false, message: "Scooter is reserved" }, status: :bad_request
      end
    else
      render json: { success: false, message: "Only the owner can delete this scooter" }, status: 404
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
