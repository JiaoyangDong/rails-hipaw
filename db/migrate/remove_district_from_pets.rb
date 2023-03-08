class RemoveDistrictFromPets < ActiveRecord::Migration[7.0]
    def change
      remove_column :pets, :district, :string
    end
  end