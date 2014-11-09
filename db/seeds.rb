
require 'fetcher'


####
# e.g. use like
# rake db:seed DL=f or
# rake db:seed DOWNLOAD=f|skip

skip_download_str = ENV['DL'] || ENV['DOWNLOAD']
if skip_download_str.present? && ['f', 'false', 'skip'].include?( skip_download_str )
  skip_download = true
  puts 'skipping downloading zips'
else
  skip_download = false
end


####
# download tasks for zips

def dowload_archive( url, dest )

  puts "downloading #{url} to #{dest}..."
  worker = Fetcher::Worker.new
  res = worker.get( url )
  ## save as binary (do NOT use any charset conversion)
  ## - worker.copy( world_url, world_dest ) - not working for now/ fix??

  puts "#{res.code}  #{res.message}"
  puts "content-type: #{res.content_type}, content-length: #{res.content_length}"

  File.open( dest, 'wb' ) do |f|
    f.write( res.body )
  end

  ## print some file stats
  puts "size: #{File.size(dest)} bytes"
end


ZIP_PATH    = "#{Rails.root}/tmp"

WORLD_URL        = 'https://github.com/openmundi/world.db/archive/master.zip'
WORLD_ZIP_NAME   = 'world.db'
WORLD_ZIP  = "#{ZIP_PATH}/#{WORLD_ZIP_NAME}.zip"

AT_CTY_URL  = 'https://github.com/openmundi/austria.db/archive/master.zip'
AT_CTY_ZIP_NAME  = 'austria.db'
AT_CTY_ZIP = "#{ZIP_PATH}/#{AT_CTY_ZIP_NAME}.zip"


def debug_tmp
  puts "pwd:        >>#{Dir.pwd}<<"  ## for debugging - print current working directory
  puts "zip_path:   >>#{ZIP_PATH}<<"
  puts "Rails.root: >>#{Rails.root}<<"

  ## check if zip file exists
  puts "WORLD_ZIP    size: #{File.size(WORLD_ZIP)} bytes"   if File.exists?(WORLD_ZIP)
  puts "AT_CTY_ZIP   size: #{File.size(AT_CTY_ZIP)} bytes" if File.exists?(AT_CTY_ZIP)
end


def dl_world
  dowload_archive( WORLD_URL, WORLD_ZIP )
end

def dl_at
  dowload_archive( AT_CTY_URL, AT_CTY_ZIP )
end


def load_world
  # NOTE: assume env (database connection) is setup
  
  LogDb.delete!
  ConfDb.delete!
  TagDb.delete!
  WorldDb.delete!

  WorldDb.read_setup_from_zip( WORLD_ZIP_NAME, 'setups/sport.db.admin', ZIP_PATH, { skip_tags: true } )
end

def load_at
  WorldDb.read_setup_from_zip( AT_CTY_ZIP_NAME, 'setups/all', ZIP_PATH, { skip_tags: true } )
end


#####
# download and import datasets

debug_tmp()

unless skip_download
  dl_world()
  dl_at()
end

load_world()
load_at()

debug_tmp()
