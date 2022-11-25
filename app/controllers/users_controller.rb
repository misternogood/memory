class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @creators = @user.creators
  end
end
