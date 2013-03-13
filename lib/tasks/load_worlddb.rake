
desc "worlddb: load all seed data from worlddb gem"
task :worlddb_load => [:environment] do |t|

  LogDb.delete!
  WorldDb.delete!  # danger zone! deletes all records

  WorldDb.read_all( find_world_db_path_from_gemfile_gitref! )
  WorldDb.stats

end
