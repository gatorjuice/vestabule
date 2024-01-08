# frozen_string_literal: true

require 'forwardable'

module Vestabule
  # Main class to be used
  class Board
    attr_reader :read_write_key

    # read_write_key: X-Vestaboard-Read-Write-Key
    def initialize(read_write_key = fetch_read_write_key)
      @read_write_key = read_write_key
    end

    def read(preview: false)
      Vestabule::Api.read_board(read_write_key, preview: preview)
    end

    def write(text)
      Vestabule::Api.write_board(read_write_key, text)
    end

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
