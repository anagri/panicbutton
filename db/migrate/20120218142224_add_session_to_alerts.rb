class AddSessionToAlerts < ActiveRecord::Migration
  def up
    add_column :alerts, :session, :string
  end

  def down
    remove_column :alerts, :session
  end
end
