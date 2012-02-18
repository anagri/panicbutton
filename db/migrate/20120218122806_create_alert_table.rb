class CreateAlertTable < ActiveRecord::Migration
  def up
    create_table :alerts do |t|
      t.string :user
      t.string :message
      t.string :geo_code
      t.timestamps
    end
  end

  def down
    drop_table :alerts
  end
end
