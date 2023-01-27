class ChangeCharacterToDescription < ActiveRecord::Migration[7.0]
  def change
    rename_column :pets, :character, :description
  end
end
