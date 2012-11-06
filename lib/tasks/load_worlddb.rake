
desc "worlddb: load all seed data from worlddb gem"
task :worlddb_load => [:environment] do |t|
  
  WorldDB.delete!  # danger zone! deletes all records
  
  WorldDB.load([
   'countries',
   'cities',
   'at/cities',
   'de/cities'
   ])
  
end
