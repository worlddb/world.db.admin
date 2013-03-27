# encoding: utf-8

class ContinentsController < ApplicationController

  # GET /continents
  def index
    @continents = Continent.all
  end
    
end # class ContinentsController
