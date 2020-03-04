class StringsController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update]

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

  private

  def guitar_params
    params.require(:guitar).permit(:tuning, :string_gauge, :string_brand, :comment)
  end

end
