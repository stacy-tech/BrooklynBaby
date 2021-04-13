class SessionsController < ApplicationController
    def new
    end

    def create 
        @user = User.find_by_email(params["email"])
        if @user && @user.authenticate(params["password"])
            session["user_id"] = @user.id 
            flash[:success] = "sucessfully logged in"
            redirect_to root_path
            
        else
            flash[:error] = "invalid credentials"
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
        flash[:error] = "Logged out!"
    end
end