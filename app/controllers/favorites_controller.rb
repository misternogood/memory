class FavoritesController < ApplicationController
  def create
    record = Record.find(params[:record_id])
    favorite = current_user.favorites.new(record_id: record.id)
    favorite.save
    redirect_to creator_record_path(record.creator_id,record.id)
  end
  
  def destroy
    record = Record.find(params[:record_id])
    favorite = current_user.favorites.find_by(record_id: record.id)
    favorite.destroy
    redirect_to creator_record_path(record.creator_id,record.id)
  end
end
