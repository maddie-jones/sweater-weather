class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.try(:authenticate, params[:password])
      render status: :ok, json:  {api_key: user.api_key}
    else
      render status: :unauthorized, json: {error: "401 unauthorized"}
    end
  end
end
