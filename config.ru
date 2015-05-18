require './app'
require 'webrick'
require './api/services/config_service'

options = ConfigurationService.new.get_server_config

# run ApiApp
Rack::Handler::WEBrick.run ApiApp, options do |server|

  config = ConfigurationService.new.get_config
  LOGGER = Logger.new config[:logger_file], config[:logger_age], config[:logger_size]

  File.open('blockstore-bridge.pid', 'w') {|f| f.write Process.pid }

  [:INT, :TERM].each do |sig|
    trap(sig) do
      server.shutdown
    end
  end
end

# start this with 'rackup' to start in development environment. Switch '-p' for port is not required as this is detected
# from configuration. eg:

# 'rackup -E development' for development environment
# 'rackup -E test' for test environment
# 'rackup -E production' for production environment