# frozen_string_literal: true

class AuthMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'].start_with?('/api/')
      if env['rack.session'][:user_id]
        @app.call(env)
      else
        [401, { 'content-type' => 'text/plain' }, ['Unauthorized']]
      end
    else
      @app.call(env)
    end
  end
end
