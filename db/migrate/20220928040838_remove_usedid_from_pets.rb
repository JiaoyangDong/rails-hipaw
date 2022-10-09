class RemoveUsedidFromPets < ActiveRecord::Migration[7.0]
  def change
    remove_column :pets, :user_id, :bigint
  end
end
