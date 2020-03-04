class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)

  end

  def show
    @user = User.find(params[:id])

    if logged_in?
      @guitar = current_user.guitars.build  # form_with 用
      @guitars = current_user.guitars.order(id: :desc).page(params[:page])
    end
      #guitars = @user.guitars
      #@guitar = Guitar.find(params[:id])
      #@guitars = Guitar.order(id: :desc).page(params[:page])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'User registered'
      redirect_to login_path
    else
      flash.now[:danger] = 'Registration of the user failed'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'User profile was updated successfully.'
      redirect_to @user
    else
      flash.now[:danger] = 'User profile was not updated successfully.'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :url, :profile, :image, :password, :password_confirmation)
  end
end
