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
      render json: { success: true, message: "Motorcycle created successfully", motorcycle: @motorcycle },
             status: :created
    else
      render json: { success: false, message: "Motorcycle not created", errors: @motorcycle.errors },
             status: :bad_request
    end
  end

  def update
    if @motorcycle.update(motorcycle_params)
      render json: { success: true, message: "Motorcycle updated successfully", motorcycle: @motorcycle },
             status: :ok
    else
      render json: { success: false, message: "Motorcycle not updated", errors: @motorcycle.errors },
             status: :bad_request
    end
  end

  def destroy
    if motorcycle = @user.motorcycles.find_by(id: params[:id])
      if motorcycle.available == true
        @reservation.destroy
        render json: { success: true, message: "Reservation deleted successfully" }, status: :ok
      else
        render json: { success: false, message: "Motorcycle is reserved" }, status: :bad_request
      end
    else
      render json: { success: false, message: "Motorcycle not found" }, status: 404
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
