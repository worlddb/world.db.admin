
LogDB.delete!
WorldDB.delete!  # danger zone! deletes all records

WorldDB.read_all( find_world_db_path_from_gemfile_gitref! )
WorldDB.stats
