class ChangeWechatInfoToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :wechat_info, :name
  end
end
