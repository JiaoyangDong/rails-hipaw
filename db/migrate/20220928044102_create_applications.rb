class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.date :application_date, presence: true
      t.string :application_status, presence: true, inclusion: { in: %w[pending approved rejected] }
      t.timestamps
    end
  end
end
