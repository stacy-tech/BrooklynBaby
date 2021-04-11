class SessionsController < ApplicationController
    
    def create 
        @user = User.find_by_email(params["email"])
        if @user && @user.authenticate(params["password"])
            session["user_id"] = @user.id 
            flash[:success] = "sucessfully logged in"
            redirect_to user_path(@user)
        else
            flash[:error] = "invalid credentials"
            redirect_to '/login'
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end