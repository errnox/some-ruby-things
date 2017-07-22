module WebApp
  class App
    helpers do
      def underline(text)
        text + "\n" + '=' * text.length
      end
    end

    def user_create
      haml_string(<<-STRING
%strong Creating new user
%pre
  #{underline('This should be underlined')}
STRING
                  )
      # settings.methods.inspect
      # 'Create new user'
      # path(:something_path)
      # redirect to(settings.app_paths[:new_post_path][:mask])
    end
  end
end
