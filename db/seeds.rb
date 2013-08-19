
LogDb.delete!
WorldDb.delete!  # danger zone! deletes all records

WorldDb.read_setup( 'setups/all', find_data_path_from_gemfile_gitref('world.db') )
WorldDb.stats
