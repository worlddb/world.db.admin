# encoding: utf-8

module WorldDbAdmin

module RoutesHelper

  ##############################
  # routes for shortcuts

  def short_country_path( country, opts={} )
    short_country_worker_path( country.key, opts )
  end

  def short_region_path( region )
    short_region_worker_path( region.country.key, region.key )
  end

  def short_city_path( city )
    short_city_worker_path( city.key )
  end
  
  def short_tag_path( tag, opts={} )
    ## NB: tag needs slug NOT key (key may contain spaces)
    short_tag_worker_path( tag.slug, opts )
  end
  
end # module RoutesHelper

end  # module WorldDbAdmin
