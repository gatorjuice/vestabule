# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

module Vestabule
  # HTTP Client for communicating with the Vestaboard API
  class Api
    VESTABOARD_API_URL = 'https://rw.vestaboard.com'

    def self.read_board(key)
      handle_response(Net::HTTP.get_response(uri, headers(key)))
    end

    def self.write_board(key, text)
      handle_response(Net::HTTP.post(uri, { text: text }.to_json, headers(key)))
    end

    private_class_method def self.uri
      URI(VESTABOARD_API_URL)
    end

    private_class_method def self.headers(key)
      {
        'X-Vestaboard-Read-Write-Key' => key,
        'Content-Type' => 'application/json'
      }
    end

    private_class_method def self.handle_response(response)
      raise ReadError, response.inspect unless response.is_a?(Net::HTTPSuccess)

      JSON.parse(response.body)
    end
  end
end
