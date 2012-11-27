# encoding: utf-8

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
    
end # class CountriesController