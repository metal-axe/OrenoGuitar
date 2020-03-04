class RecordsController < ApplicationController
  before_action :require_user_logged_in

  def show
    @record = Record.find(params[:id])
    #@user = User.find(params[:id])
    #@record = @user.records
  end

  def new
    @record = Record.new
    if logged_in?
      @record = current_user.records.build  # form_with 用
      @records = current_user.records.order(id: :desc).page(params[:page])
    end
  end

  def create
    @record = current_user.records.build(record_params)
    if @record.save
      flash[:success] = 'Registered your record。'
      redirect_to user_path(current_user)
    else
      @records = current_user.records.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'Record registration failed'
      render :new
    end
  end


  private

  def record_params
    params.require(:record).permit(:custom_record, :maintenance_record)
  end

end
