class RemoveDescriptionFromPets < ActiveRecord::Migration[7.0]
  def change
    remove_column :pets, :description, :text
  end
end
