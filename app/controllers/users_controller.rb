class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    return redirect_to user_path(@user) if @user.update(user_params)

    render :edit
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin)
  end
end
