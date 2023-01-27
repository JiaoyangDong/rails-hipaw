class AddVaccinatedToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :vaccinated, :boolean
  end
end
