class AddWechatIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :wechat_id, :string
  end
end
