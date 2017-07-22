require 'rack'

app = Rack::Builder.new do
  run Proc.new { |env| [200, {'Content-Type' => 'text/html'},
                        ['This is web server running...']] }

  map '/time' do
    run Proc.new { |env| [200, {'Content-Type' => 'text/html'},
                          ["#{Time.now}"]] }

    map '/hello' do
      run Proc.new { |env| [200, {'Content-Type' => 'text/html'},
                            ['Hello.']] }
    end

    map '/now' do
      run Proc.new { |env| [200, {'Content-Type' => 'text/html'},
                            ["<html><head><style type='text/css' media='screen'>#{File.open('bootstrap/dist/css/bootstrap.min.css', 'r').read}</style></head>\n#{`org-ruby ~/temp/org/org.org`}<script type='text/javascript'>#{File.open('jQuery/jquery-1.11.0.min.js', 'r').read} #{File.open('bootstrap/dist/js/bootstrap.min.js', 'r').read}</script></html>"] ] }
    end
  end

end

Rack::Handler::WEBrick.run app, :Port => 4321
