# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

module Vestabule
  # HTTP Client for communicating with the Vestaboard API
  class Api
    VESTABOARD_API_URL = 'https://rw.vestaboard.com'

    def self.read_board(key)
      uri = URI(VESTABOARD_API_URL)
      res = Net::HTTP.get_response(uri, headers(key))

      return JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)

      raise ReadError, res.inspect
    end

    private_class_method def self.headers(key)
      {
        'X-Vestaboard-Read-Write-Key' => key,
        'Content-Type' => 'application/json'
      }
    end
  end
end
