# encoding: utf-8

module PartHelper

  ###################################
  # helper for shared partials
  #
  # by convention all start w/ render_

  def render_tags( tags )
    render :partial => 'shared/tags', :locals => { :tags => tags }
  end

  def render_cities( cities )
    render :partial => 'shared/cities', :locals => { :cities => cities }
  end


end # module PartHelper