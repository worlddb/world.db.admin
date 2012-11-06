class CreateDb < ActiveRecord::Migration
  def up
    WorldDB::CreateDB.up
  end

  def down
    raise IrreversibleMigration
  end
end
