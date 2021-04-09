class UsersController < ApplicationController
   def index
    @user = User.find_by_id(params[:id])
   end

   def new
    @user = User.new
   end
      
   def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to @user 
    else
        flash[:error]=@user.errors.full_messages.to_sentence
        render :new
   end
end