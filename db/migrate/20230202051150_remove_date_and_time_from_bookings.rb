class RemoveDateAndTimeFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :date_and_time, :datetime
  end
end
