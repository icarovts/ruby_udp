require 'resources'

class Server
  
  attr_accessor :udp, :client, :method_class, :key, :word, :port
  
  def initialize(host, port)
    @udp = UDPSocket.new
    @port = port 
    @udp.bind host, @port
  end
  
  def run
    loop do
      msg, @client = @udp.recvfrom(500)
      msg = JSON.parse msg
      @method_class = get_method_class(msg['method'])
      @key = msg['key']
      @word = msg['word']
      @action = msg['action']
      teste = @udp.send(execute, 0, @client[3], @client[1])
    end
  end
  
private
  
  def get_method_class(method)
    case method
      when 'gost': Crypt::Gost
      when 'blowfish': Crypt::Blowfish
    end
  end

  def execute
    action = "#{@action}_block"
    crypt = @method_class.new(@key)
    res = crypt.send(action, @word)
    return res
  end

end
