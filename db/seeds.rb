
LogDb.delete!
WorldDb.delete!  # danger zone! deletes all records

WorldDb.read_all( find_world_db_path_from_gemfile_gitref! )
WorldDb.stats
