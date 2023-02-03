class AddCharacToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :character, :string
  end
end
