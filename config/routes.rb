

Worlddbhost::Application.routes.draw do

  ###
  # mount sinatra app (bundled w/ worlddb-service gem) for json api service

  # todo: add  JSON API link to layout

  get '/api' => redirect('/api/v1')
  mount WorldDb::Service::Server, :at => '/api/v1'  # NB: make sure to require 'worlddb-service'

  ## mount sinatra app (bundled w/ logutils gem)
  mount LogDb::Server, :at => '/logs'    # NB: make sure to require 'logutils/server'


  mount WorldDbAdmin::Engine, :at => '/'  # mount a root possible?

end
