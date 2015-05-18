require 'base64'
require './api/services/config_service'

class KeyProvider
  def initialize(config_service = ConfigurationService)
    @config_service = config_service.new
  end

  def validate_auth_header(auth_header)
    config = ConfigurationService.new.get_config
    stored_auth = "Basic #{Base64.strict_encode64(":#{config[:api_auth_token]}")}".chomp
    stored_auth == auth_header
  end
end