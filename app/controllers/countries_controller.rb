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

  # GET /countries/1
  def show
    @country = Country.find( params[:id] )
  end
  
end # class CountriesController