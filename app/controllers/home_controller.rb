class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to categories_path
    else
      render 'index'
    end
  end

  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to categories_path, notice: "Welcome #{@user.name}!"
    else
      render :sign_up
    end
  end

  def log_in
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to category_path, notice: "Welcome back #{@user.name}!"
    else
      flash[:alert] = 'Incorrect email or password'
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role, :password_confirmation)
  end
end
