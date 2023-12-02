# frozen_string_literal: true

require 'hashie'
require 'oj'
require 'veeqo/version'
require 'veeqo/config'
require 'veeqo/connection'
require 'veeqo/exception'
require 'veeqo/request'
require 'veeqo/resource_actions'
require 'veeqo/subresource_actions'
require 'veeqo/middleware/auth'
require 'veeqo/middleware/http_exception'
require 'veeqo/resources/resource'

module Veeqo
  resources = File.join(File.dirname(__FILE__), 'veeqo', 'resources', '**', '*.rb')
  Dir.glob(resources, &method(:require))

  class << self
    attr_reader :api, :config

    def configure(&block)
      @config = Veeqo::Config.new.tap(&block)
      @api = Veeqo::Connection.build(@config)
    end
  end
  # Your code goes here...
end
