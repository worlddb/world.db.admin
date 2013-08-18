
require 'worlddb/admin/version'
require 'worlddb/admin/engine'

module WorldDbAdmin

  def self.banner
    "worlddb-admin #{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  ##  cut off folders lib(#1)/worlddb(#2) to get to root
  def self.root
    "#{File.expand_path( File.dirname(File.dirname(File.dirname(__FILE__))) )}"
  end

end


# say hello
puts WorldDbAdmin.banner
