class Api::V2::MyReservationsController < ApplicationController
  before_action :authorize

  def index
    @reservations = @user.reservations.all
    render json: @reservations
  end
end
