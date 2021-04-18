class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
      
  def create
    
    if user_params[:type] == "parent"
      @user = User.new(user_params)
    else
      @user = Sitter.new(user_params)
    end
    if @user.save
      session[:user_id] = @user.id 
      flash[:notice] = "Account Successfully created!"
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
  end

   private 
  def user_params
    params.require(:user).permit(:name, :role, :email, :password, :password_confirmation)
  end
end