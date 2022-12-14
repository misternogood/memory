class CreatorsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_creator, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :new, :create]
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
    @records = @creator.records.page(params[:page]).per(1).order("created_at DESC")
  end

  def edit
  end

  def update
    if @creator.update(creator_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    if @creator.destroy
      redirect_to user_path(current_user.id)
    else
      render :show
    end
  end

  private

  def creator_params
    params.require(:creator).permit(:name, :birth_date, :image).merge(user_id: current_user.id)
  end

  def set_creator
    @creator = Creator.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if @creator.user_id != current_user.id
  end
end
