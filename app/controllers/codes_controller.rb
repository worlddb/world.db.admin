# encoding: utf-8

class CodesController < ApplicationController

  # GET /code
  def index
    @countries = Country.by_title.all
  end
    
end # class CodesController
