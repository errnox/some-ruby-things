module WebApp
  class App
    helpers do
      def self.underline(string)
        string + "\n" + '=' *  string.length
      end
    end
  end
end
