module WebApp
  class App
    settings = 'Settings'
    @@settings= settings

    # Also, try this:
    #
    # def initialize
    #   # @settings = 'SETTINGS'
    #   # @settings = @@settings
    # end
    
    def info
      puts 'Info'
    end
  end
end

class User < WebApp::App
  def create
    puts @@settings
  end
end

user = User.new
user.create
