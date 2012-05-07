require 'client'
require 'server'

port = 7773
host = 'localhost'

puts "INICIANDO SERVER..."
server = Server.new host, port
server.run
