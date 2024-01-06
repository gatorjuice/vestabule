# frozen_string_literal: true

require 'forwardable'

module Vestabule
  # Main class to be used
  class Board
    extend Forwardable

    attr_reader :read_write_key, :layout

    def_delegators :@layout, :to_text

    # read_write_key: X-Vestaboard-Read-Write-Key
    def initialize(read_write_key = fetch_read_write_key)
      @read_write_key = read_write_key
    end

    def read(preview: true)
      response = Vestabule::Api.read_board(read_write_key)

      @layout = Vestabule::Layout.new(response.dig('currentMessage', 'layout'))

      text = to_text

      puts text if preview

      text
    end

    def write; end

    private

    def fetch_read_write_key
      ENV.fetch('VESTABULE_READ_WRITE_KEY')
    rescue KeyError
      raise ApiKeyError, <<~MSG.gsub("\n", ' ')
        Must be initialized with an API Read Write Key or
        have 'VESTABULE_READ_WRITE_KEY' set in the environment.
      MSG
    end
  end
end
