
desc "worlddb: load all seed data from worlddb gem"
task :worlddb_load => [:environment] do |t|
  
  WorldDB.delete!  # danger zone! deletes all records
  
  WorldDB.read_all
  WorldDB.stats
  
end
