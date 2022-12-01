class CreatorsController < ApplicationController
  before_action :set_creator, only: [:show, :edit, :update]
  def index
    @creators = Creator.order('created_at DESC')
  end

  def new
    @creator = Creator.new
  end

  def create 
    @creator = Creator.new(creator_params)
    if @creator.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @records = @creator.records.includes(:creator)
  end

  def edit
  end

  def update
    if @creator.update(creator_params)
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end
end

private

  def creator_params
    params.require(:creator).permit(:name, :birth_date, :image).merge(user_id: current_user.id)
  end

  def set_creator
    @creator = Creator.find(params[:id])
  end
