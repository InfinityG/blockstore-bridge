require 'sinatra/base'
require './api/services/block_store_service'
require './api/errors/bridge_error'
require 'json'

module Sinatra
  module NameRoutes
    def self.registered(app)

      app.get '/getinfo' do
        begin
          BlockStoreService.new.get_cli_info
        rescue BridgeError => e
          LOGGER.error "Error processing request! || Error: #{e.message}"
          status 400
          return e.message.to_json
        end
      end

      app.get '/lookup/:name' do
        begin
          name = params[:name]
          BlockStoreService.new.lookup(name)
        rescue BridgeError => e
          LOGGER.error "Error processing request! || Error: #{e.message}"
          status 400
          return e.message.to_json
        end
      end

      app.post '/preorder' do
        content_type :json

        # Payload:
        # {"name":""}

        body = request.body.read

        data = begin
          JSON.parse(body, :symbolize_names => true)
        rescue
          status 400
          return 'Unable to parse JSON!'.to_json
        end

        # process
        begin
          name = data[:name]
          BlockStoreService.new.preorder_name(name)
        rescue BridgeError => e
          LOGGER.error "Error processing request! || Error: #{e.message}"
          status 400
          return e.message.to_json
        end
      end

      app.post '/register' do
        content_type :json

        # Payload:
        # {"name":""}

        body = request.body.read

        data = begin
          JSON.parse(body, :symbolize_names => true)
        rescue
          status 400
          return 'Unable to parse JSON!'.to_json
        end

        # process
        begin
          name = data[:name]
          BlockStoreService.new.register(name)
        rescue BridgeError => e
          LOGGER.error "Error processing request! || Error: #{e.message}"
          status 400
          return e.message.to_json
        end
      end

      app.post '/update' do
        content_type :json

        # Payload:
        # {"name":"", "data":""}

        body = request.body.read

        data = begin
          JSON.parse(body, :symbolize_names => true)
        rescue
          status 400
          return 'Unable to parse JSON!'.to_json
        end

        # process
        begin
          name = data[:name]
          name_data = data[:data]
          BlockStoreService.new.update_data_for_name(name, name_data)
        rescue BridgeError => e
          LOGGER.error "Error processing request! || Error: #{e.message}"
          status 400
          return e.message.to_json
        end
      end

      app.post '/transfer' do
        content_type :json

        # Payload:
        # {"name":"", "new_owner":""}

        body = request.body.read

        data = begin
          JSON.parse(body, :symbolize_names => true)
        rescue
          status 400
          return 'Unable to parse JSON!'.to_json
        end

        # process
        begin
          name = data[:name]
          address = data[:address]
          BlockStoreService.new.transfer(name, address)
        rescue BridgeError => e
          LOGGER.error "Error processing request! || Error: #{e.message}"
          status 400
          return e.message.to_json
        end
      end

      app.get '/health' do
        status 200
        'OK!'
      end

    end
  end
  register NameRoutes
end