class SitterController < ApplicationController

    def new
        @sitterr = Sitter.new
    end
          
    def create
        @sitter = Sitter.new(sitter_params)
        @sitter.user = current_user
        if @sitter.save
          session[:sitter_id] = @sitter.id 
          flash[:notice] = "Account Successfully created!"
          redirect_to sitter_path(@sitter)
        else
          flash[:errors] = @sitter.errors.full_messages
          render :new
        end
    end
    
    def show
        @sitter = Sitter.find(params[:id])
        @bookings = @sitter.bookings
    end
    
    private 
      def user_params
        params.require(:user).permit(:name, :role, :email, :password, :password_confirmation)
    end
end