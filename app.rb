require 'socket'
require 'ruby_cowsay'
require 'fortune_gem'

server = TCPServer.new('0.0.0.0', 8000)

loop do
  socket = server.accept
  request = socket.gets

  steg = Cow.new({ :cow => 'skeleton' })
  puts steg.say(FortuneGem.give_fortune({:max_length => 80}))
  response = steg.say FortuneGem.give_fortune({:max_length => 80})
  socket.print "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\nConnection: close\r\n\r\n"
  socket.print response
  socket.close
end
