require 'sinatra'
require 'sinatra/rroute'

module SuperApp
  class App < Sinatra::Base

    register Sinatra::Rroute

    get '/' do
      'Hello there!'
    end

    get %r{/foo/([\w]+)/?} do |name|
      name
    end

    gget '/something/:name/?' => :something, :as =>
      :something_path, :mask => '/something/:name/'

    def something
      settings.app_paths.inspect
    end

    nnamespace '/api' do
      nnamespace '/v1' do
        gget %r{/description/?} => :describe_api_v1, :as =>
          :api_v1_description, :mask => '/description/'

        def describe_api_v1
          'API v1 Description'
        end

	# Without 'nnamespace'
	#
        # get %r{/api/v1/[dD]escription/} do
        #   "FOOBAROAO"
        # end
      end

      nnamespace '/v2' do
        gget '/description/?' => :describe_api_v2, :as =>
          :api_v2_description, :mask => '/description/'

        def describe_api_v2
          'API v2 Description'
        end
      end

      get mmap(%r{/info[sz]*/?}, '/info/',
               :api_info) do
        request.url + ' - ' + path(:api_info)
      end

      gget '/overview/' => :api_overview, :as => :api_overview, :mask =>
        '/overview/'
      def api_overview
        path :api_overview
      end
    end

    get mmap('/overview/', '/overview/', :overview) do
      path :overview
    end

    nnamespace '/api' do
      gget '/underview/' => :api_underview, :as => :api_underview, :mask =>
        '/underview/'
      def api_underview
        path :api_underview
      end
    end
  end
end
