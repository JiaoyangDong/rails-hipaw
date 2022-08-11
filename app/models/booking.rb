class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :pet, uniqueness: { scope: :user , message: 'the pet can only be booked once.'}
end
