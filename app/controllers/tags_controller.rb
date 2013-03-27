# encoding: utf-8

class TagsController < ApplicationController

  # GET /tags
  def index
    ## fix: Tag.by_key   must be  key asc !! but is desc? why? fix it
    @tags = Tag.order('key asc').all
  end
  
  # GET /tag/:key e.g. /tag/euro or /tag/north_america
  def shortcut
    @tag   = Tag.find_by_slug!( params[:key] )
    @order = params[:order] || 'title'

    ## magic parameter for dev -> generate yaml text template
    if params[:yml].present? || params[:yaml].present?
      render 'template.txt.erb', :layout => false, :content_type => 'text/plain'
      return
    end

    render :show
  end

  # GET /tags/:id e.g. /tags/1
  def show
    @tag = Tag.find( params[:id] )
  end

end # class TagsController
