class AddDefaultValueToPetAttributes < ActiveRecord::Migration[7.0]
  def change
    change_column_default :pets, :neutered, false
    change_column_default :pets, :vaccinated, false
    change_column_default :pets, :special_need, false
  end
end
