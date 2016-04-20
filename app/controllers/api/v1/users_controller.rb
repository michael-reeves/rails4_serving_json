class Api::V1::UsersController < ApplicationController
  respond_to :json

  def index
    respond_with User.all
  end

  def show
    respond_with User.find_by(id: params[:id])
  end

  def create
    respond_with User.create(user_params), location: nil
  end

  def update
    respond_with User.update(params[:id], user_params)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
