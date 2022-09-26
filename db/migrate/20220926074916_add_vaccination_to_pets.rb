class AddVaccinationToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :vaccination, :string
  end
end
