require 'pp'

module WebApp
  class App
    def self.call(env)
      response = PP.pp(env, '').split("\n")
        .map { |line| "<li>#{line}</li>" }

      [200, {'Content-Type' => 'text/html'}, response]
    end
  end
end
