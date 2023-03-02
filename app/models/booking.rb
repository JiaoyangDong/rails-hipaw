class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validate :max_bookings_per_user
  validate :unique_pet_booking
  validates :user_id, uniqueness: { scope: :pet_id }

  private

  def max_bookings_per_user
    if user.bookings.count >= 10
      errors.add(:user, "user can't have more than 10 favorites")
    end
  end

  def unique_pet_booking
    if Booking.exists?(user: user, pet: pet)
      errors.add(:pet, "can't be requested twice")
    end
  end

end
