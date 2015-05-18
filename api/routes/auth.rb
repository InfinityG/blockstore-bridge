require 'sinatra/base'
require './api/services/config_service'
require './api/utils/key_provider'

module Sinatra
  module AuthRoutes
    def self.registered(app)

      #this filter applies to everything except options, challenge and login routes
      app.before do
        if request.request_method == 'OPTIONS'
          return
        else
          config = ConfigurationService.new.get_config
          should_authenticate = config[:authenticate_incoming]

          if should_authenticate
            auth = env['HTTP_AUTHORIZATION']

            halt 401, 'Unauthorized!' if auth == nil

            result = (KeyProvider.new.validate_auth_header(auth))

            halt 401, 'Unauthorized!' unless result
          end
        end
      end
    end
  end

  register AuthRoutes
end