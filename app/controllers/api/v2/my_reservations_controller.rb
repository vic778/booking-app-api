class Api::V2::MyReservationsController < ApplicationController
  before_action :authorize
  before_action :set_reservation

  def index
    @reservations = @user.reservations.all
    render json: @reservations
  end

  # def show
  #   render json: @reservation
  # end

  private
  
  def set_reservation
    @reservation = @user.reservations.find(params[:id])
  end
end
