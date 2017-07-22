require 'rack'
require_relative './app'
require_relative './replacer_middleware'


use ReplacerMiddleware
run WebApp::App
