class SessionsController < ApplicationController
    
    def create 
        @user = User.find_by_email(params["email"])
        if @user && @user.authenticate(params["password"])
            session["user_id"] = @user.id 
            flash[:success] = "sucessfully logged in"
            redirect_to @user
        else
            flash[:error] = "invalid credentials"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Sucessfully logged out!"
        redirect_to root_path
    end
end