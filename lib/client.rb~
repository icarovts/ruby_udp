require 'resources'

class Client
  
  attr_accessor :udp, :host, :port, :response

  def initialize(host, port)
    @udp = UDPSocket.new
    @host = host
    @port = port
  end
  
  def method_missing(method, args)
    args[:action] = method
    execute(args)
  end
  
private
  
  def execute(params)
    json = params.to_json
    @udp.send(json, 0, @host, @port)
    @response = @udp.recvfrom(500)[0]
  end
end
