# encoding: utf-8

module WorldDbAdmin

class RegionsController < WorldDbAdminController

  # GET /regions
  def index
    @countries = Country.all
  end
  
  include RoutesHelper   # need access to short_country_path for redirect

  # GET /:country_key/:key e.g. /us/ny or /de/by
  def shortcut
    ## for now just redirect to country page w/ anchor includes e.g country/#ny
    country = Country.find_by_key( params[:country_key] )
    redirect_to short_country_path( country, anchor: params[:key] )
  end



end # class RegionsController

end  # module WorldDbAdmin
