# encoding: utf-8

module RoutesHelper

  def csv_countries_by_tag_path( tag )
    ## NB: tag needs slug NOT key (key may contain spaces)
    csv_countries_by_tag_worker_path( tag.slug )
  end

  def short_country_path( country )
    short_country_worker_path( country.key )
  end

  def short_region_path( region )
    short_region_worker_path( region.country.key, region.key )
  end
  
  def short_tag_path( tag )
    ## NB: tag needs slug NOT key (key may contain spaces)
    short_tag_worker_path( tag.slug )
  end
  
end # module RoutesHelper  