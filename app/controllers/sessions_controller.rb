class SessionsController < ApplicationController
    def home 
        @user = User.find_by_id(params[:id])
    end

    def create 
        @user = User.find_by_email(params["email"])
        if @user && @user.authenticate(params["password"])
            session["user_id"] = @user.id 
            redirect_to user_path(@user)
        else
            flash[:error] = "invalid credentials"
            redirect_to '/login'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end