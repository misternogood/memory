class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  def new
    @record_form = RecordForm.new
  end

  def create
    @record_form = RecordForm.new(record_form_params)
    if @record_form.valid?
      @record_form.save
      redirect_to creator_path(@record_form.creator_id)
    else
      render :new
    end
  end

  def show
  end

  def edit
    record_attributes = @record.attributes
    @record_form = RecordForm.new(record_attributes)
  end

  def update
    @record_form = RecordForm.new(record_form_params)
    @record_form.image ||= @record.image.blob
    if @record_form.valid?
      @record_form.update(record_form_params, @record)
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

  def record_form_params
    params.require(:record_form).permit(:title, :content, :image, :created_date).merge(creator_id: params[:creator_id])
  end

  def set_record
    @record = Record.find(params[:id])
  end
end
