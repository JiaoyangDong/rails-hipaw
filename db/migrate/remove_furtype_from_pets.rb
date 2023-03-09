class RemoveFurtypeFromPets < ActiveRecord::Migration[7.0]
  def change
    remove_column :pets, :fur_type, :string
  end
end