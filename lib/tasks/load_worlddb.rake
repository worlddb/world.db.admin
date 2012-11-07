
desc "worlddb: load all seed data from worlddb gem"
task :worlddb_load => [:environment] do |t|
  
  WorldDB.delete!  # danger zone! deletes all records
  
  WorldDB.load([
   'de.countries',
   'at/cities',
   'be/cities',
   'by/cities',
   'ca/cities',
   'ch/cities',
   'cy/cities',
   'de/cities',
   'dk/cities',
   'en/cities',
   'es/cities',
   'fr/cities',
   'gr/cities',
   'hr/cities',
   'it/cities',
   'mx/cities',
   'nl/cities',
   'pt/cities',
   'ro/cities',
   'ru/cities',
   'sc/cities',
   'tr/cities',
   'ua/cities',
   'us/cities'
   ])
  
end
