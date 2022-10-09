class RemoveColumnsFromPets < ActiveRecord::Migration[7.0]
  def change
    remove_columns :pets, :fur_type, :district
  end
end
