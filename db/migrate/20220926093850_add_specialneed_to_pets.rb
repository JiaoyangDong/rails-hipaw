class AddSpecialneedToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :special_need, :string
  end
end
