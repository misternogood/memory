class CreatorsController < ApplicationController
  def index
    @creators = Creator.order('created_at DESC')
  end

  def new
    @creator = Creator.new
  end

  def create 
    @creator = Creator.new(creator_params)
    if @creator.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @creator = Creator.find(params[:id])
    @records = @creator.records.includes(:creator)
  end

end

private

  def creator_params
    params.require(:creator).permit(:name, :birth_date, :image).merge(user_id: current_user.id)
  end