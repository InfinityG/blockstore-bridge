
module ConfigurationConstants
  module Environments
    DEVELOPMENT = {
        :host => '0.0.0.0',
        :port => 9000,
        :api_auth_token => 'fc530340a3324756a557616b75bb56fd',
        :authenticate_incoming => true,
        :logger_file => 'app_log.log',
        :logger_age => 10,
        :logger_size => 1024000,
        :default_request_timeout => 60,
        :allowed_origin => '*',
        :bitcoin_secret => ''
    }

    TEST = {
        :host => '0.0.0.0',
        :port => 9000,
        :api_auth_token => 'fc530340a3324756a557616b75bb56fd',
        :authenticate_incoming => false,
        :logger_file => 'app_log.log',
        :logger_age => 10,
        :logger_size => 1024000,
        :default_request_timeout => 60,
        :allowed_origin => '*',
        :bitcoin_secret => ''
    }

    PRODUCTION = {
      :host => '0.0.0.0',
      :port => 9000,
      :api_auth_token => 'b50cccaecd894470ad6567f78f9dda99',
      :authenticate_incoming => false,
      :logger_file => 'app_log.log',
      :logger_age => 10,
      :logger_size => 1024000,
      :default_request_timeout => 60,
      :allowed_origin => '*',
      :bitcoin_secret => ''
    }
  end
end