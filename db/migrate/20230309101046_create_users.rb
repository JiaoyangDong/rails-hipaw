class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :open_id
      t.string :role
      t.string :wechat_id
      t.string :image
      t.timestamps
    end
  end
end
