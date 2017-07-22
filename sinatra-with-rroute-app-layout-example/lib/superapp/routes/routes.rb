require_relative '../controllers/user'


module WebApp
  class App < Sinatra::Base
    gget %r{/something/?} => :user_create, :as =>
      :something_path, :mask => '/something'

    gget %r{/post/new/?} => :post_new, :as =>
      :new_post_path, :mask => '/post/new'

    gget %r{/post/update/?} => :post_update, :as =>
      :update_post_path, :mask => '/post/update'

    10.times do |i|
      creation_date = Time.now
      get mmap(%r{/route/#{i}/?}, "/route/#{i}",
               "route_#{i}_path".to_sym) do
        "This is route #{i} (created at #{creation_date})."
      end
    end
  end
end
