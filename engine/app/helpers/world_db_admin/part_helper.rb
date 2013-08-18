# encoding: utf-8

module WorldDbAdmin

module PartHelper

  ###################################
  # helper for shared partials
  #
  # by convention all start w/ render_

  def render_tags( tags )
    render :partial => 'world_db_admin/shared/tags', :locals => { :tags => tags }
  end

  def render_cities( cities )
    render :partial => 'world_db_admin/shared/cities', :locals => { :cities => cities }
  end
  
  
  def render_countries( countries, opts={} )

    if opts[:order].present?
      if opts[:order] == 'key'
        countries = countries.order( 'key ASC' )
      elsif opts[:order] == 'title'
        countries = countries.order( 'title ASC' )
      elsif opts[:order] == 'code'
        countries = countries.order( 'code ASC' )
      end
    end

    render :partial => 'world_db_admin/shared/countries',
           :locals => { :countries => countries,
                        :count => opts[:count] }
  end

  def render_regions( regions, opts={} )

    if opts[:order].present?
      if opts[:order] == 'key'
        regions = regions.order( 'key ASC' )
      elsif opts[:order] == 'title'
        regions = regions.order( 'title ASC' )
      elsif opts[:order] == 'code'
        regions = regions.order( 'code ASC' )
      end
    end

    render :partial => 'world_db_admin/shared/regions',
           :locals => { :regions => regions,
                        :count => opts[:count] }
  end


end # module PartHelper

end  # module WorldDbAdmin
