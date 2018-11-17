class UsersController < ApplicationController
  before_action :b_user, only: [:show, :update, :edit, :destroy]

  def show
    redirect_to_root
  end

  def index
    redirect_to_root
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
    def b_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :admin, :password, :email)
    end
end
