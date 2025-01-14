# frozen_string_literal: true

require 'faraday'

module Veeqo
  module Middleware
    class Auth < Faraday::Middleware
      def call(env)
        env[:request_headers]['x-api-key'] = @options[:api_key]
        env[:request_headers]['x-api-request'] = 'true'
        @app.call env
      end
    end
  end
end
