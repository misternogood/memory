class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to creator_path(@record.creator_id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to creator_record_path(@record.id)
    else
      render :edit
    end
  end

  def destroy
    if @record.destroy
      redirect_to creator_path(@record.creator.id)
    else
      render :show
    end
  end

  private

  def record_params
    params.require(:record).permit(:title, :content, :image).merge(creator_id: params[:creator_id])
  end

  def set_record
    @record = Record.find(params[:id])
  end
end
