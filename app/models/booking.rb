class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validate: max_bookings_per_user

  private

  def max_bookings_per_user
    if user.bookings.count >= 3
      errors.add(:user, "can't have more than 3 requests")
    end
  end

end
