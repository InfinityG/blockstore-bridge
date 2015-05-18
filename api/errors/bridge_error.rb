
class BridgeError < StandardError

  def initialize(msg = nil)
    @message = msg
  end

  def message
    {:errors => [@message]}
  end
end