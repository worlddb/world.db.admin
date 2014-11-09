# encoding: utf-8

module WorldDbAdmin

module ApplicationHelper

  def powered_by
    content_tag :div do
      link_to( 'Questions? Comments?', 'http://groups.google.com/group/openmundi' ) + " | " +
      link_to( "world.db/#{WorldDb::VERSION}", 'https://github.com/worlddb/world.db.ruby' )  + ', ' +
      link_to( "world.db.admin/#{WorldDbAdmin::VERSION}", 'https://github.com/worlddb/world.db.admin' ) + ' - ' + 
      content_tag( :span, "Ruby/#{RUBY_VERSION} (#{RUBY_RELEASE_DATE}/#{RUBY_PLATFORM}) on") + ' ' +
      content_tag( :span, "Rails/#{Rails.version} (#{Rails.env})" ) + " | " + 
      link_to( 'Icon Drawer Flags', 'http://www.icondrawer.com' )
      ## content_tag( :span, "#{request.headers['SERVER_SOFTWARE'] || request.headers['SERVER']}" )
    end
  end


  def image_tag_for_country( country, opts={} )
    if opts[:size] == 'large' || opts[:size] == '64x64'
      image_tag "flags/64x64/#{country.key}.png"
    else
      image_tag "flags/24x24/#{country.key}.png"
    end
  end
  
  
  
  def city_style( city )
 # city_1_000_000 and up
 # city_500_000 and up
 # city_100_000 and up
 # city_10_000 and up or less
 # city_nil
 
    pop =  if city.popm.present?   then city.popm
           elsif city.pop.present? then city.pop
           else  nil
           end
 
    if pop.blank?
      return 'city_nil'
    elsif pop > 10000000
      return 'city_10_000_000'
    elsif pop > 1000000
      return 'city_1_000_000'
    elsif pop > 500000
      return 'city_500_000'
    elsif pop > 100000
      return 'city_100_000'
    else # assume < 100_000
      return 'city_10_000'
    end
 
  end

  def country_style( country )
 # country_100_000_000 and up
 # country_10_000_000 and up
 # country_1_000_000 and up
 # country_100_000 and up or less
 # country_nil
 
    if country.pop.blank?
      return 'country_nil'
    elsif country.pop > 100000000
      return 'country_100_000_000'
    elsif country.pop > 10000000
      return 'country_10_000_000'
    elsif country.pop > 1000000
      return 'country_1_000_000'
    else # assume < 100_000
      return 'country_100_000'
    end
 
  end


end # module ApplicationHelper

end  # module WorldDbAdmin
