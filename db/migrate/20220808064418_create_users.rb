class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :wechat_info

      t.timestamps
    end
  end
end
