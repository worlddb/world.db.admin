# encoding: utf-8

class RegionsController < ApplicationController

  # GET /regions
  def index
    @countries = Country.all
  end
  
  # GET /:country_key/:key e.g. /us/ny or /de/by
  def shortcut
    ## for now just redirect to country page w/ anchor includes e.g country/#ny
    redirect_to short_country_path( params[:country_key], :anchor => params[:key] )
  end



end # class RegionsController