require 'rack'
require 'launchy'
require 'pp'

port = 4321
web_app = lambda do |env|
  [200, {'Content-Type' => 'text/html'},
   ["<pre>#{PP.pp env, dump = ''}</pre>"]]
end

Launchy.open("http://localhost:#{port}")
Rack::Handler::WEBrick.run web_app, :Port => port
