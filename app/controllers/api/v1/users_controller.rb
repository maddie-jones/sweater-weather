class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)

    render status: :created, json:  {api_key: user.api_key}
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
