class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    redirect_to "/api/v1/users/#{user}"
  end

  def show
    user = User.find(params[:id])
    api_key = ApiKey.new(user)
    api_serialized = ApiSerializer.new(api_key)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
