class GuitarsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def show
    @guitar = Guitar.find(params[:id])

  end

  def new
    @guitar = Guitar.new
    if logged_in?
      @guitar = current_user.guitars.build  # form_with 用
      @guitars = current_user.guitars.order(id: :desc).page(params[:page])
    end
  end

  def create
    @guitar = current_user.guitars.build(guitar_params)
    if @guitar.save
      flash[:success] = 'Registered your guitar。'
      redirect_to user_path(current_user)
    else
      @guitars = current_user.guitars.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'Guitar registration failed'
      render :new
    end
  end

  def edit
    @guitar = Guitar.find(params[:id])
  end


  def update
    @guitar = Guitar.find(params[:id])

    if @guitar.update(guitar_params)
      flash[:success] = 'Updated successfully.'
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = 'Updated failed.'
      render :edit
    end
  end

  def destroy
    @guitar.destroy
    flash[:success] = 'Data deleted'
    redirect_back(fallback_location: root_path)
  end

  private

  def guitar_params
    params.require(:guitar).permit(:category, :brand, :model, :neck_type, :neck_wood, :body_type, :body_wood, :fret, :number_of_fret, :fret_wood, :scale, :nut, :bridge, :string_space, :neck_pickup, :middle_pickup, :bridg_pickup, :controlls, :tuners, :tuning, :string_gauge, :string_brand, :hardware_color, :main_or_sub, :others, :comment, :image)
  end
end


