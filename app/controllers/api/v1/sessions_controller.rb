class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    render status: :ok, json:  {api_key: user.api_key}
  end
end
