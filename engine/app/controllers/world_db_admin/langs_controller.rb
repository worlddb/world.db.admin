# encoding: utf-8

module WorldDbAdmin

class LangsController < WorldDbAdminController

  # GET /langs
  def index
    @langs = Lang.all
  end
    
end # class LangsController

end  # module WorldDbAdmin
