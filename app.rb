require 'sinatra/base'
require 'openssl'
require 'webrick'
require 'webrick/https'
require 'logger'

require './api/routes/cors'
require './api/routes/auth'
require './api/routes/names'

class ApiApp < Sinatra::Base

  configure do
    # Register routes
    register Sinatra::CorsRoutes
    register Sinatra::AuthRoutes
    register Sinatra::NameRoutes
  end

end