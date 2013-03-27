# encoding: utf-8

class ContinentsController < ApplicationController

  # GET /continents
  def index
    @continents = Continent.all

    @order      = params[:order] || 'title'
  end

end # class ContinentsController
