# encoding: utf-8

module WorldDbAdmin

class ContinentsController < WorldDbAdminController

  # GET /continents
  def index
    @continents = Continent.all

    @order      = params[:order] || 'name'
  end

end # class ContinentsController

end  # module WorldDbAdmin
