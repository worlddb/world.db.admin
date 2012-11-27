# encoding: utf-8

module RoutesHelper

  ################################
  ## routes for export / download (dl)

  def csv_countries_path
    dl_countries_path( format: 'csv' )
  end
  
  def table_countries_path
    dl_countries_path( format: 'html' )
  end
  
  def csv_cities_path
    dl_cities_path( format: 'csv' )
  end

  def table_cities_path
    dl_cities_path( format: 'html' )
  end
  
  def csv_countries_by_tag_path( tag )
    ## NB: tag needs slug NOT key (key may contain spaces)
    dl_countries_by_tag_worker_path( tag.slug, format: 'csv')
  end
  
  def table_countries_by_tag_path( tag )
    ## NB: tag needs slug NOT key (key may contain spaces)
    dl_countries_by_tag_worker_path( tag.slug, format: 'html')
  end
  

  ##############################
  ## routes for shortcuts
  
  def short_country_path( country )
    short_country_worker_path( country.key )
  end

  def short_region_path( region )
    short_region_worker_path( region.country.key, region.key )
  end

  def short_city_path( city )
    short_city_worker_path( city.key )
  end
  
  def short_tag_path( tag )
    ## NB: tag needs slug NOT key (key may contain spaces)
    short_tag_worker_path( tag.slug )
  end
  
end # module RoutesHelper  