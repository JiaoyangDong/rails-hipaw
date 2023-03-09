class RemoveCharacterFromPets < ActiveRecord::Migration[7.0]
    def change
      remove_column :pets, :character, :string
    end
  end