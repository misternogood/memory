class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :move_to_index, only: [:show]
  def show
    @user = User.find(params[:id])
    @creators = @user.creators
  end

  private
  def move_to_index
    @user = User.find(params[:id])
    redirect_to root_path if @user.id != current_user.id
  end
end