require 'haml'

require 'sinatra/base'
require 'sinatra/rroute'


module WebApp
  class App < Sinatra::Base
    configure do
      register Sinatra::Rroute
    end

    get mmap('/?', '/', :index_path) do
      haml :index, :layout => 'layouts/base'.to_sym
    end
  end
end
