class RemoveAdoptedstatusFromPets < ActiveRecord::Migration[7.0]
  def change
    remove_column :pets, :adopted_status, :boolean
  end
end
