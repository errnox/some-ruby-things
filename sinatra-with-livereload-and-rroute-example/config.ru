require 'rack'
require 'rack-livereload'
require_relative 'app'

run WebApp::App
