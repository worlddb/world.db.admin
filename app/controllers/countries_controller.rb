# encoding: utf-8


COUNTRY_FILTER_TAGS = [
  'all',
  'un',
  'europe',
  'asia',
  'africa',
  'america',
  'north america',
  'south america',
  'central america',
  'caribbean',
  'oceania',
  'south asia',
  'southeast asia', 
  'central asia',
  'east asia',
  'middle east',
  'western asia',
  'northern africa',
  'western africa',
  'central africa',
  'southern africa',
  'northern europe',
  'western europe',
  'central europe',
  'eastern europe',
  'southern europe',
  'southeastern europe',
  'balkans',
  'nordic',
  'eu',
  'schengen',
  'euro',
  'g8',
  'g5',
  'g20',
  'fifa',
  'uefa',
  'pop_100m_n_up',
  'pop_10m_n_up',
  'pop_1m_n_up',
  'area_1_000_000_n_up',
  'area_100_000_n_up',
  'area_1_000_n_up'
]

class CountriesController < ApplicationController

  # GET /countries
  def index

    ## for now store order and tag in session    
    ## todo/fix: find a  better way to store user order and filter settings
    
    session[:order] = order = params[:order] || session[:order] || 'title'
    session[:tag]   = tag   = params[:tag]   || session[:tag]   || 'all'    
    
    @countries = nil    

    if order == 'pop'
      @countries = Country.by_pop
    elsif order == 'area'
      @countries = Country.by_area
    elsif order == 'title'    
      @countries = Country.by_title
    else
      @countries = Country.by_title
    end
        
    if tag == 'all'
      ## do nothing; include all
    else 
      ## fix/todo:  add with_tag() scope to Country!!!    
      country_ids = Tag.find_by_key!( tag ).country_ids
    
      @countries = @countries.find( country_ids )      
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
    
end # class CountriesController