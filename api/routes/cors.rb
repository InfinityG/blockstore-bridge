require 'sinatra/base'
require './api/services/config_service'

module Sinatra
  module CorsRoutes

    def self.registered(app)

      config = ConfigurationService.new.get_config

      app.options '*' do
        response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept, Authorization'
        response.headers['Access-Control-Allow-Origin'] = config[:allowed_origin]
        response.headers['Access-Control-Allow-Credentials'] = 'false'
        response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, OPTIONS'
      end

      app.before do
        # if request.request_method == 'OPTIONS'
          # Needed for AngularJS
          response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept, Authorization, Content-Length'
          response.headers['Access-Control-Allow-Origin'] = config[:allowed_origin]
          response.headers['Access-Control-Allow-Credentials'] = 'false'
          response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, OPTIONS'

          # halt 200
        # end
      end
    end
  end
  register CorsRoutes
end
