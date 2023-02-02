json.bookings do
    json.array! @bookings, partial: "api/v1/bookings/booking", as: :booking
    end