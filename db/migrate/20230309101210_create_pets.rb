class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name, presence: true
      t.string :species, presence: true
      t.string :age
      t.string :gender
      t.string :image_url
      t.boolean :neutered, default: false
      t.string :size
      t.string :description
      t.boolean :vaccinated, default: false
      t.boolean :adoptable, default: true
      t.boolean :special_need, default: false
      t.timestamps
    end
  end
end
