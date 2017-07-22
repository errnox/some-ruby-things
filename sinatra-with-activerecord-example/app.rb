require 'sinatra/base'
require 'active_record'


ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database =>
                                        :'db.sqlite3')


class Post < ActiveRecord::Base
  
end



module SuperApp
  class App < Sinatra::Base

    configure do
    end

    get '/' do
      posts = Post.all
      puts posts.inspect
      posts.length
    end

  end
end
