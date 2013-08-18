# encoding: utf-8

module WorldDbAdmin

class CitiesController < WorldDbAdminController

  # GET /cities
  def index
    
    order = params[:order]
    @cities = case order
        when 'pop'   then  City.by_pop.all
        when 'popm'  then  City.order( 'popm desc' ).all
        when 'title' then  City.by_title.all
        else               City.by_key.all
    end
    
  end

  # GET /:key
  def shortcut
    ## for now just redirect to cities page w/ anchor includes e.g cities/#newyork
    redirect_to cities_path( :anchor => params[:key] )
  end

end # class CitiesController

end  # module WorldDbAdmin
