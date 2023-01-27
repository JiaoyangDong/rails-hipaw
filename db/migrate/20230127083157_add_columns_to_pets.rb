class AddColumnsToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :adoptable, :boolean
    add_column :pets, :special_need, :boolean
  end
end
