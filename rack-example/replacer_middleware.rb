class ReplacerMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    body.map { |s| s.gsub!(/HTTP/i, 'FOOBAR') }
    body. << '<hr/><b>This has been inserted by Rack middleware.</b>'
    [status, headers, body]
  end
end
