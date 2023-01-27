class RemoveVaccinationFromPets < ActiveRecord::Migration[7.0]
  def change
    remove_column :pets, :vaccination, :string
  end
end
