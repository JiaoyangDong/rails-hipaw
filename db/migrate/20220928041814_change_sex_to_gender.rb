class ChangeSexToGender < ActiveRecord::Migration[7.0]
  def change
    rename_column :pets, :sex, :gender
  end
end
