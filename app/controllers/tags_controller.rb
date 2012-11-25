# encoding: utf-8

class TagsController < ApplicationController

  # GET /tags
  def index
    @tags = Tag.order('key asc').all
  end

  # GET /tags/1
  def show
    @tag = Tag.find( params[:id] )
  end
  
end # class TagsController
