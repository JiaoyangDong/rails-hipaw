class RemoveColumnsFromPets < ActiveRecord::Migration[7.0]
  def change
    remove_column :pets, :special_need
    remove_column :pets, :adoption_status
  end
end
