class CreateDb < ActiveRecord::Migration
  def up
    LogDB.create
    WorldDB.create
  end

  def down
    raise IrreversibleMigration
  end
end
