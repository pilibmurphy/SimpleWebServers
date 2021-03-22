# http_server.rb
require 'socket'
require 'rack'

class Repsponce
  
  def call(env)
    [200, {"Content-Type" => "text/plain"}, "hi"]
  end
end

app = Repsponce.new
server = TCPServer.new 5000

while session = server.accept
  request = session.gets
  puts request
  method, full_path = request.split(' ')
  path, query = full_path.split('?')
  status, headers, body = app.call({
    'REQUEST_METHOD' => method,
    'PATH_INFO' => path,
    'QUERY_STRING' => query
  })
  
  print query
  if query.include?("&")
    qryArray = query.split("&")
    x = ""
    y = ""
    
    #if array not of size two don't bother
    if qryArray.length() == 2
      if qryArray[0].include?("x=")
        #remove x=
        x = qryArray[0].gsub("x=", "")
        print(x + "\n")
      else
        if qryArray[1].include?("x=")
          #remove x=
          x = qryArray[1].gsub("x=", "")
        print(x + "\n")
        end
      end

      ## this is just a repeat of code move this into a method

      if qryArray[0].include?("y=")
        #remove y=
        y = qryArray[0].gsub("y=", "")
        print(y + "\n")
      else
        if qryArray[1].include?("y=")
          #remove y=
          y = qryArray[1].gsub("y=", "")
          print(y + "\n")
        end
      end

    end
  end

  
  #if sucess = true()
  intX = x.to_i
  intY = y.to_i

  ans = intX + intY
  body = ans.to_s
  

  #split at the &
  #make a mthod called removed
  #if contains y= or x=
  #remove y= or x=

  #return the numbers

  session.print "HTTP/1.1 #{status}\r\n"
  headers.each do |key, value|
    session.print "#{key}: #{value}\r\n"
  end
  session.print "\r\n"
  session.print body
  session.close
end

class Div
  
end


# if env[QUERY_STRING].include?("flip")
#   message = hello
# else
#   message = hi
# end