# encoding: utf-8

class LangsController < ApplicationController

  # GET /langs
  def index
    @langs = Lang.all
  end
    
end # class LangsController