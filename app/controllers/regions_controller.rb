# encoding: utf-8

class RegionsController < ApplicationController

  # GET /regions
  def index
    @countries = Country.all
  end


end # class RegionsController