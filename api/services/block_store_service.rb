require './api/services/config_service'

class BlockStoreService
  # This service wraps cli commands to blockstore-cli. This assumes that blockstore is installed and running on the
  # same machine/container.

  def initialize(config_service = ConfigurationService)
    @config_service = config_service.new
  end

  def ping_cli
    begin
      result = `blockstore-cli ping`

      raise Exception, result if $?.exitstatus == nil || $?.exitstatus > 0
      return result
    rescue Exception => e
      raise BridgeError, e.to_s
    end
  end

  def get_cli_info
    begin
      result = `blockstore-cli getinfo`

      raise Exception, result if $?.exitstatus == nil || $?.exitstatus > 0
      return result
    rescue Exception => e
      raise BridgeError, e.to_s
    end
  end

  def preorder_name(name)
    begin
      secret = @config_service[:bitcoin_secret]
      result = `blockstore-cli preorder #{name} #{secret} 2>&1`

      raise Exception, result if $?.exitstatus == nil || $?.exitstatus > 0
      return result
    rescue Exception => e
      raise BridgeError, e.to_s
    end
  end

  def register_name(name)
    begin
      secret = @config_service[:bitcoin_secret]
      result = `blockstore-cli register #{name} #{secret} 2>&1`

      raise Exception, result if $?.exitstatus == nil || $?.exitstatus > 0
      return result
    rescue Exception => e
      raise BridgeError, e.to_s
    end
  end

  def update_data_for_name(name, data)
    begin
      secret = @config_service[:bitcoin_secret]
      result = `blockstore-cli update #{name} #{data} #{secret} 2>&1`

      raise Exception, result if $?.exitstatus == nil || $?.exitstatus > 0
      return result
    rescue Exception => e
      raise BridgeError, e.to_s
    end
  end

  def transfer_name(name, new_owner_address)
    begin
      secret = @config_service[:bitcoin_secret]
      result = `blockstore-cli transfer #{name} #{new_owner_address} #{secret} 2>&1`

      raise Exception, result if $?.exitstatus == nil || $?.exitstatus > 0
      return result
    rescue Exception => e
      raise BridgeError, e.to_s
    end
  end

  def lookup(name)
    begin
      result = `blockstore-cli lookup #{name} 2>&1`

      raise Exception, result if $?.exitstatus == nil || $?.exitstatus > 0
      return result
    rescue Exception => e
      raise BridgeError, e.to_s
    end
  end

end