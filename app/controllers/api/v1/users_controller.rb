class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[update destroy]

  def create
    @user = User.new(user_params)
    if @user.save
      token = encode_token({ user_id: @user.id })
      render json: { success: true, message: 'User created successfully' }, status: :created
    else
      render json: { success: false, message: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: { success: true, message: 'User updated successfully' }, status: :ok
    else
      render json: { success: false, message: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: { success: true, message: 'User deleted successfully' }, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
