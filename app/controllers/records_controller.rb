class RecordsController < ApplicationController
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
end

private

def record_params
  params.require(:record).permit(:title, :content, :image).merge(creator_id: params[:creator_id])
end
