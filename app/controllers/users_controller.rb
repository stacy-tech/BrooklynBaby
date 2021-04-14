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
      redirect_to @user
    else
      # flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    redirect_if_not_logged_in
    @user = User.find(params[:id])
    redirect_to '/' if !@user
  end

   private #strong parameters
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end