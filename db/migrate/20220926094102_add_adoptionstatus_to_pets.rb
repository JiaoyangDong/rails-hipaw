class AddAdoptionstatusToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :adoption_status, :string
  end
end
