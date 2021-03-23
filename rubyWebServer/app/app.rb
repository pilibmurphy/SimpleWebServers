require_relative 'modulo'
require 'socket'
require "addressable/uri"
require 'json'

server = TCPServer.new 5000

mod = Modulo.new

while session = server.accept
  
  request = session.gets
  headers = {"Content-Type" => "application/json", "Access-Control" => "*"}

  begin

  method, full_path = request.split(' ')
  uri = Addressable::URI.parse(full_path)
  uri.query_values
  x = uri.query_values['x']
  y = uri.query_values['y']
  ans = mod.modulo(x.to_i, y.to_i)
  equation = "%d modulo %d = %d" % [x,y,ans]
  data = {'Errors' => false, 'Equation' => equation, 'Answer' => ans}
  responce = data.to_json
  status = 200

  rescue

    #Set the data to return a failed json and set the status code to 400
    data = {'Error' => true, 'Equation' => nil, 'Answer' => nil}
    responce = data.to_json
    status = 400

  end

  #Send the repsonce

  session.print "HTTP/1.1 #{status}\r\n"
  headers.each do |key, value|
    session.print "#{key}: #{value}\r\n"
  end
  session.print "\r\n"
  session.print responce
  session.close
end

#gem install socket
#gem install addressable
#gem install json