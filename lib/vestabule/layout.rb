# frozen_string_literal: true

require 'json'

require_relative 'char_map'

module Vestabule
  class Layout
    include CharMap

    attr_reader :rows

    def initialize(layout_string)
      @rows = JSON.parse(layout_string)
    end

    def to_text
      rows.map do |row|
        row.map do |char_code|
          CharMap::CHARS[char_code]
        end.join
      end.join("\n")
    end
  end
end
