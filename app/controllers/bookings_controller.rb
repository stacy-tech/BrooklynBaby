class BookingsController < ApplicationController
    

    def new
        @booking = Booking.new(user_id: params[:user_id])
    end

    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            if logged_in?
                if is_users_booking?(@booking)
                    flash[:notice] = "Booking Successfully booked."
                    redirect_to user_booking_path(@booking.user_id, @booking.id)
                else
                    redirect_to home_path
                end
            else
                redirect_to login_path
            end
        else
            render :new
        end
    end

    def show
        get_booking_and_user
    end

    def destroy
        @booking = Booking.find(params[:id])
        if logged_in?
            if is_users_booking?(@booking)
                @booking.destroy
                    flash[:error] = "Booking deleted."
                    redirect_to root_path
                end
            end
        else
        
    end

    def edit
        get_booking_and_user
    end

    def update
        @booking = Booking.find(params[:id])
        if @booking.update(booking_params)
            if logged_in?
                if is_users_booking?(@booking)
                    flash[:notice] = "Booking Updated Successfully"
                    redirect_to booking_path(@booking.id)
                end
            end
        else
            render :edit
    end

    private

    def booking_params
        params.require(:booking).permit(:availability, :time, :date, :status)
    end

    def get_booking_and_user
        @booking = Booking.find_by(id: params[:id])
        @user = User.find_by(id: @booking.user_id)
    end

end