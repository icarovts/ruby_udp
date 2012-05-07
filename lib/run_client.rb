require 'client'
require 'server'

port = 7773
host = 'localhost'

puts "INICIANDO CLIENT..."
client = Client.new host, port
client.encrypt :word => 'testando', :key => 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', :method => 'gost'
puts client.response
client.decrypt :word => client.response, :key => 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', :method => 'gost'
puts client.response

