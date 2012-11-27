# encoding: utf-8

require 'csv'

class CountriesController < ApplicationController

  # GET /countries
  def index
    
    order = params[:order]
    if order == 'pop'
      @countries = Country.by_pop.all
    elsif order == 'area'
      @countries = Country.by_area.all
    else
      @countries = Country.by_title.all
    end
  end
  
  # GET /:key  e.g  /at or /us etc.
  def shortcut
    @country = Country.find_by_key!( params[:key] )
    render :show
  end

  # GET /countries/:id  e.g. /countries/1
  def show
    @country = Country.find( params[:id] )
  end
  
  
  # GET /countries/csv
  def export_csv
    csv_string = csv_for( Country.by_key.all )    
    render :text => csv_string, :content_type => 'text/plain'
    
    #send_data( csv_string, 
    #           :type => csv_content_type(),
    #           :filename => 'countries.csv',
    #           :disposition => 'attachment',
    #           :status => '200 OK' )
  end
  
  # GET /tag/:key/csv  e.g. /tag/north_america/csv
  def export_csv_tag
    csv_string = csv_for( Tag.find_by_slug!(params[:key]).countries )
    render :text => csv_string, :content_type => 'text/plain'
  end
  
  
  private
  def csv_content_type
    case request.user_agent
    when /windows/i then 'application/vnd.ms-excel'
    else                 'text/csv'
    end
  end
  
  def csv_for( countries )

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
  
end # class CountriesController