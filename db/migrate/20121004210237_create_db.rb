class CreateDb < ActiveRecord::Migration
  def up
    WorldDB.create
  end

  def down
    raise IrreversibleMigration
  end
end
