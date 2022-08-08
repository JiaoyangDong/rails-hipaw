class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, presence: true
      t.string :species, presence: true
      t.text :description, presence: true, length: { in: 20..200 }
      t.string :fur_type, inclusion: { in: %w[long short hairless] }
      t.string :age
      t.string :sex, presence: true, inclusion: { in: %w[male female unspecified]}
      t.string :image_url, presence: true
      t.string :district, presence: true, inclusion: { in: %w[huangpu xuhui changning jingan putuo hongkou yangpu baoshan minhang jiading pudong songjiang jinshan qingpu fengxian chongming]}
      t.boolean :adopted_status, default: false

      t.timestamps
    end
  end
end
