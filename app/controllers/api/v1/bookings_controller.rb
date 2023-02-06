class Api::V1::BookingsController < Api::V1::BaseController
  def show
    @booking = Booking.find(params[:id])
    render json: {booking: @booking, pet: @booking.pet}
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pet = Pet.find(params[:pet_id])
    @booking.user = @current_user
    if @booking.save
      render json: {booking: @booking, pet: @booking.pet}, status: :created
    else
      @ori_booking = Booking.find_by(pet: @booking.pet, user:@booking.user)
      render_error
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user, :pet)
  end

  def render_error
    render json: { errors: @booking.errors.full_messages, booking: @ori_booking }, status: :unprocessable_entity
  end

end
