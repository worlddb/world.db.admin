# encoding: utf-8

module WorldDbAdmin

class CodesController < WorldDbAdminController

  # GET /code
  def index
    @countries = Country.by_title.all
  end
    
end # class CodesController

end  # module WorldDbAdmin
