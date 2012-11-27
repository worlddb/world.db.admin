# encoding: utf-8


require 'csv'


class ExportController < ApplicationController

  
  # GET /dl/countries(.format) e.g. /countries.csv or /countries.html
  def countries

    # todo: remove .all why? why not?
    data = data_for_countries( Country.by_key.all )

    respond_to do |format|
      format.html { render :text => table_for_data( data ) }
      format.csv  { render :text => csv_for_data( data ), :content_type => 'text/plain' }
    end
    
    #send_data( csv_string, 
    #           :type => csv_content_type(),
    #           :filename => 'countries.csv',
    #           :disposition => 'attachment',
    #           :status => '200 OK' )
  end # method countries
  
  
  # GET /tag/:key(.format)  e.g. /tag/north_america/csv
  def countries_by_tag
    data = data_for_countries( Tag.find_by_slug!(params[:key]).countries )
    respond_to do |format|
      format.html { render :text => table_for_data( data ) }
      format.csv  { render :text => csv_for_data( data ), :content_type => 'text/plain' }
    end
  end
  
  # GET /dl/cities(.format)
  def cities

    # todo: remove .all why? why not?
    data = data_for_cities( City.by_key.all )    

    respond_to do |format|
      format.html { render :text => table_for_data( data ) }
      format.csv  { render :text => csv_for_data( data ), :content_type => 'text/plain' }
    end
  end
  
  
  private
  def csv_content_type
    case request.user_agent
    when /windows/i then 'application/vnd.ms-excel'
    else                 'text/csv'
    end
  end


  def data_for_cities( cities )
    ## fix: move to model? why? why not?
    
    ## add virtual column like kind for metro, metro|city, city, district
  
    ## todo add region.title if present  
  
    data = []
    cities.each do |city|
      data << { key:      city.key,
                title:    city.title,
                code:     city.code,
                pop:      city.pop,
                popm:     city.popm,
                area:     city.area,
                synonyms: city.synonyms,
                country:  city.country.title }      
    end # each city
    data
  end

  def data_for_countries( countries )
    ## fix: move to model? why? why not?  
  
    ## todo: add tags too??
    
    data = []
    countries.each do |country|
      data << { key:      country.key,
                title:    country.title,
                code:     country.code,
                pop:      country.pop,
                area:     country.area,
                synonyms: country.synonyms }
    end # each country
    data  
  end
  
  
  def csv_for_data( data )
    ## :col_sep => "\t"
    ## :col_sep => ";"

    ## todo: use rec.key for headers/first row
    
    csv_string = CSV.generate() do |csv|
      data.each do |rec|
        csv << rec.values      
      end
    end
    csv_string
  end # method csv_for_data


  def table_for_data( data )
    buf = ""
    buf << "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'></head><body>\n"
    buf << "<table>\n"
    data.each do |rec|
      buf << "  <tr>"
      rec.values.each do |value|
        buf << "<td>#{value}</td>"
      end
      buf << "</tr>\n"
    end
    buf << "</table>\n"
    buf << "</body></html>"
    buf
  end # method table_for_data

  
end # class ExportController