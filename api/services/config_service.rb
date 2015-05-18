require './api/constants/configuration_constants'
require 'openssl'

class ConfigurationService
  include ConfigurationConstants::Environments

  def get_config

    case ENV['RACK_ENV']
      when 'test'
        TEST
      when 'production'
        PRODUCTION
      else
        DEVELOPMENT
    end
  end

  def get_server_config
    case ENV['RACK_ENV']
      when 'test'
        {
            :Host => TEST[:host],
            :Port => TEST[:port]
            # :SSLEnable => true,
            # :SSLCertificate => OpenSSL::X509::Certificate.new(File.open(TEST[:ssl_cert_path]).read),
            # :SSLPrivateKey => OpenSSL::PKey::RSA.new(File.open(TEST[:ssl_private_key_path]).read)
        }
      when 'production'
        {
            :Host => PRODUCTION[:host],
            :Port => PRODUCTION[:port]
            # :SSLEnable => true,
            # :SSLCertificate => OpenSSL::X509::Certificate.new(File.open(PRODUCTION[:ssl_cert_path]).read),
            # :SSLPrivateKey => OpenSSL::PKey::RSA.new(File.open(PRODUCTION[:ssl_private_key_path]).read)
        }
      else
        {
            :Host => DEVELOPMENT[:host],
            :Port => DEVELOPMENT[:port]
        }
    end
  end
end