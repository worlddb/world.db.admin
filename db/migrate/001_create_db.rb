class CreateDb < ActiveRecord::Migration
  def up
    LogDb.create    # logs  table
    ConfDb.create   # props table
    TagDb.create    # tags, taggings table
    WorldDb.create
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
