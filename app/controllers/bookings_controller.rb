class BookingsController < ApplicationController

    def new
        @booking = Booking.new
    end

    def index
        @bookings = current_user.bookings
    end

    def create
        @booking = Booking.new(booking_params)
        @booking.user = current_user
        if @booking.save
            redirect_to booking_path(@booking)
        else
            render :new
        end
    end
end