class UsersController < ApplicationController
  # def index
  #   @users = User.all
  # end

  def new
    @user = User.new
  end
      
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id 
      flash[:notice] = "Account Successfully created!"
      redirect_to root_path
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

   private #strong parameters
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end