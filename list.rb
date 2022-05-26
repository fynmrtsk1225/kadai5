require 'webrick'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '/',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'list.html.erb')

server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')

server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')

server.mount('/transferee.cgi', WEBrick::HTTPServlet::CGIHandler, 'transferee.rb')

server.mount('/false.cgi', WEBrick::HTTPServlet::CGIHandler, 'false.rb')

server.start