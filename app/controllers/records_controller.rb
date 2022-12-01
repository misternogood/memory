class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit]
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
    @creator = Creator.find(params[:id])
  end

  def edit

end

private

def record_params
  params.require(:record).permit(:title, :content, :image).merge(creator_id: params[:creator_id])
end

def set_creator
  @record = Record.find(params[:id])
end
