# encoding: utf-8

module WorldDbAdmin

module ApiHelper

  def worlddb_api_defined?
    defined?( WorldDb::Service::Server ) == 'constant'
  end

  def worlddb_api?
    # shorter alias (remove long version??? why? why not?)
    worlddb_api_defined?
  end


  ################################
  # routes for export / download (dl)

  def csv_countries_path
    # dl_countries_path( format: 'csv' )
    '/api/v1/countries.csv'
  end
  
  def table_countries_path
    # dl_countries_path( format: 'html' )
    '/api/v1/countries.html'
  end
  
  def csv_cities_path
    # dl_cities_path( format: 'csv' )
    '/api/v1/cities.csv'
  end

  def table_cities_path
    # dl_cities_path( format: 'html' )
    '/api/v1/cities.html'
  end
  
  def csv_countries_by_tag_path( tag )
    ## NB: tag needs slug NOT key (key may contain spaces)
    ## dl_countries_by_tag_worker_path( tag.slug, format: 'csv')
    "/api/v1/tag/#{tag.slug}.csv"
  end
  
  def table_countries_by_tag_path( tag )
    ## NB: tag needs slug NOT key (key may contain spaces)
    ## dl_countries_by_tag_worker_path( tag.slug, format: 'html')
    "/api/v1/tag/#{tag.slug}.html"
  end


end # module ApiHelper

end  # module WorldDbAdmin

