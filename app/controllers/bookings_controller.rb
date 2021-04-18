class BookingsController < ApplicationController

    def new
        @booking = Booking.new
    end

    def index
        # require 'pry'
        # binding.pry
        if current_user.id == params[:user_id].to_i
            @bookings = current_user.bookings
        else
            redirect_to login_path
        end
  
    end 

    def create
        @booking = Booking.new(booking_params)
        @booking.user = current_user
        if @booking.save
            redirect_to booking_path(@booking)
        else
            require 'pry'
            binding.pry
            render :new
        end
    end

    def show 
        @bookings = Booking.find_by_id(params[:id])
    end

    private

    def booking_params 
        # require 'pry'
        # binding.pry
        params.require(:booking).permit(:age, :datetime, :rate, :total_hours, :status)
    end
end