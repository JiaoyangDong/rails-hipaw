class Api::V1::BookingsController < Api::V1::BaseController
  def create
    @booking = Booking.new(booking_params)
    @booking.pet = Pet.find(params[:pet_id])
    @booking.user = @current_user
    # @booking.user = @current_user
    if @booking.save
      render json: {booking: @booking}
    else
      render_error
    end
  end

  private

  def pet_params
    params.require(:booking).permit(:user, :pet, :date_and_time)
  end

  def render_error
    render json: { errors: @booking.errors.full_messages }, status: :unprocessable_entity
  end

end
