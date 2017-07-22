module WebApp
  class App
    helpers do
      def haml_string(string)
        Haml::Engine.new(string).render
      end
    end
  end
end
