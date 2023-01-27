class Pet < ApplicationRecord
  # belongs_to :user
  validates :name, length: { maximum: 15}
  validates :species, inclusion: { in: %w(dog cat other), message: " valid species are dog, cat, or other" }
  validates :size, inclusion: { in: %w(mini small medium large), message: " valid sizes are mini, small, medium, or large" }
  validates :gender, inclusion: { in: %w(male female) }
  validates :neutered, inclusion: [true, false]
  validates :vaccinated, inclusion: [true, false]
  validates :special_need, inclusion: [true, false]
  validates :description, length: { maximum: 300 }
  validates :adoptable, inclusion: [true, false]

  has_many :bookings

  has_one_attached :image
end
