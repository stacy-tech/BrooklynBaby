class BookingsController < ApplicationController
    

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @booking = @user.bookings.create
        else
            @booking = Booking.new
        end
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @bookings = @user.bookings.current
        else
            @bookings = Booking.current
        end
    end

    def create
        @booking = current_user.bookings.create(booking_params)
        if @booking.save
            redirect_to bookings_path
        else
            render :new
        end
    end

    def show; end

    def destroy
        @booking.destroy
        redirect_to current_user
    end

    def edit; end

    def update
        if @booking.update(booking_params)
            redirect_to booking_path(@booking)
        else
            render :edit
        end
    end

    private

    def set_booking
        @booking = Booking.find(params[:id])
    end

    def authenticate_user!
        redirect_to bookings_path if @booking.user != current_user
    end

    def booking_params
        params.require(:booking).permit(:availability, :time, :date, :status)
    end

end