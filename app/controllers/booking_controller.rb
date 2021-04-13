class BookingsController < ApplicationController
    def index
        if logged_in?
            @bookings = current_user.bookings 
        else
            flash[:error] = "Please login to access this page."
            redirect_to login_path
        end
    end

end