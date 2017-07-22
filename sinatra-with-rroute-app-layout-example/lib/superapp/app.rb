require 'sinatra/base'
require 'sinatra/rroute'
require 'haml'
require 'pp'

module WebApp
  class App < Sinatra::Base
    register Sinatra::Rroute

    require_relative 'helpers/init'

    after do
      links = []
      settings.app_paths.each do |name, path|
        links << '<li"><a href="' + path[:mask] + '">' +
          name.to_s.gsub(/_path$/, '').gsub(/_/, ' ').capitalize +
          '</a></li>'
      end
      links = '<span>' + links.join(' | ') + '</span><hr/>'

      response.body[0] = links + (response.body[0] || '')
    end

    def something
      'This is something.'
    end

    get mmap('/', '/', :home_path) do
      # Inject some debug info:
      #
      # require 'pp'
      # '<pre>' + PP.pp(settings.app_paths, '') + '</pre>'

      links = '<ul>'
      settings.app_paths.each do |name, path|
        links << '<li><a href="' + path[:mask] + '">' +
          name.to_s.gsub(/_path$/, '').gsub(/_/, ' ').capitalize +
          '</a></li>'
      end
      links << '</ul>'
    end

    gget %r{/post/?} => :do_post_test, :as => :post_test, :mask =>
      '/post'
    def do_post_test
      params.inspect
    end

    get mmap('/self', '/self', :self_path) do
      '<pre>' + PP.pp(self.methods, '') + '</pre>'
    end
  end
end

require_relative 'controllers/init'
require_relative 'routes/init'
