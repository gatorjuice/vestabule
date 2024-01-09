# frozen_string_literal: true

require_relative 'vestabule/version'
require_relative 'vestabule/api'
require_relative 'vestabule/board'
require_relative 'vestabule/layout'

module Vestabule
  class ReadError < StandardError; end
  class LayoutError < ArgumentError
  class ApiKeyError < ArgumentError; end
end
