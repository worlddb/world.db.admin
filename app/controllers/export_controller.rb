# encoding: utf-8


require 'csv'


class ExportController < ApplicationController

  
  # GET /countries/csv
  def csv_countries
    csv_string = csv_for_countries( Country.by_key.all )    
    render :text => csv_string, :content_type => 'text/plain'
    
    #send_data( csv_string, 
    #           :type => csv_content_type(),
    #           :filename => 'countries.csv',
    #           :disposition => 'attachment',
    #           :status => '200 OK' )
  end
  
  # GET /tag/:key/csv  e.g. /tag/north_america/csv
  def csv_countries_by_tag
    csv_string = csv_for_countries( Tag.find_by_slug!(params[:key]).countries )
    render :text => csv_string, :content_type => 'text/plain'
  end
  
  # GET /cities/csv
  def csv_cities
    csv_string = csv_for_cities( City.by_key.all )    
    render :text => csv_string, :content_type => 'text/plain'    
  end
  
  
  private
  def csv_content_type
    case request.user_agent
    when /windows/i then 'application/vnd.ms-excel'
    else                 'text/csv'
    end
  end


  def csv_for_cities( cities )
    ## fix: move to model? why? why not?
    
    ## add virtual column like kind for metro, metro|city, city, district
  
    ## todo add region.title if present  
  
    csv_string = CSV.generate() do |csv|
       cities.each do |city|
         csv << [city.key, city.title, city.code, city.pop, city.popm, city.area, city.synonyms, city.country.title]      
       end
    end
    csv_string
  end

  
  def csv_for_countries( countries )
    ## fix: move to model? why? why not?  
  
    ## todo: add tags too??
    
    ## :col_sep => "\t"
    ## :col_sep => ";"
    
    csv_string = CSV.generate() do |csv|
       countries.each do |country|
         csv << [country.key, country.title, country.code, country.pop, country.area, country.synonyms]      
       end
    end
    csv_string
  end

end # class ExportController