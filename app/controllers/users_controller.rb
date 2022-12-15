class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :move_to_index, only: [:show]
  def show
    @user = User.find(params[:id])
    @creators = @user.creators
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).order('created_at DESC').pluck(:record_id)
    @favorite_records = Record.find(favorites)
    @favorite_records = Kaminari.paginate_array(@favorite_records).page(params[:page]).per(20)
  end

  private

  def move_to_index
    @user = User.find(params[:id])
    redirect_to root_path if @user.id != current_user.id
  end
end
