class Api::V2::ReservationsController < ApplicationController
  before_action :authorize, only: [:create, :update, :destroy]
  before_action :set_reservation, only: %i[update destroy]

  def index
    # @reservations = @user.reservations.all
    # render json: @reservations

    # Show all available motorcycles for reservation
    @motorcycles = Motorcycle.where(available: true)
    render json: @motorcycles
  end

  def show
    # show particular motorcycle for reservation
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
    render json: @motorcycle
  end

  def create
    @reservation = @user.reservations.new(reservation_params)
    # update motorcycle availability
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
    if @reservation.save
      @motorcycle.update(available: false)
      render json: { success: true, message: "Reservation created successfully", reservation: @reservation },
             status: :created
    else
      render json: { success: false, message: "Reservation not created", errors: @reservation.errors },
             status: :bad_request
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: { success: true, message: "Reservation updated successfully", reservation: @reservation },
             status: :ok
    else
      render json: { success: false, message: "Reservation not updated", errors: @reservation.errors },
             status: :bad_request
    end
  end

  def destroy
    # update motorcycle availability
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
    if @reservation.destroy
      @motorcycle.update(available: true)
      render json: { success: true, message: "Reservation deleted successfully" }, status: :ok
    else
      render json: { success: false, message: "Reservation not deleted" }, status: :bad_request
    end
  end

  private

  def set_reservation
    @reservation = @user.reservations.find(params[:id])
  end

  def reservation_params
    params.permit(:motorcycle_id, :duration, :price)
  end

end
