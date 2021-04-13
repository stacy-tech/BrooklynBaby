class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create 
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = @user.id 
            flash[:success] = "sucessfully logged in"
            redirect_to root_path
            
        else
            flash[:error] = "Incorrect email or password."
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end
end