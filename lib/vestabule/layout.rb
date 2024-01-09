# frozen_string_literal: true

require 'json'

require_relative 'char_map'

module Vestabule
  # A board's configuration of characters
  class Layout
    include CharMap

    attr_reader :rows

    def initialize(layout)
      @rows = parse_layout(layout)

      validate_rows!
    end

    def print_preview
      preview =
        rows.map do |row|
          row.map do |char_code|
            CharMap::CHARS[char_code]
          end.join
        end.join("\n")

      puts(preview)

      preview
    end

    def parse_layout(layout)
      if layout.is_a?(String)
        JSON.parse(layout)
      elsif layout.is_a?(Array)
        layout
      else
        raise LayoutError, 'Unrecognized layout format'
      end
    end

    private

    def validate_rows!
      return if rows.size == 6 && rows.all? { |row| row.size == 22 }

      raise LayoutError
    end
  end
end
