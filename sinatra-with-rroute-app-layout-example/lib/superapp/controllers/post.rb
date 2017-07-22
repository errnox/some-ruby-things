module WebApp
  class App
    def post_new
      app_paths = PP.pp(settings.app_paths, '').inspect
      haml_string(<<-STRING
%em Creating new post
%pre= #{app_paths}
STRING
                  )
    end

    def post_update
      redirect to(path(:something_path))
    end
  end
end
