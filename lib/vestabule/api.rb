# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

module Vestabule
  # HTTP Client for communicating with the Vestaboard API
  class Api
    VESTABOARD_API_URL = 'https://rw.vestaboard.com'

    def self.read_board(key, preview: false)
      uri = URI(VESTABOARD_API_URL)
      response = Net::HTTP.get_response(uri, headers(key))

      raise ReadError, response.inspect unless response.is_a?(Net::HTTPSuccess)

      handle_response(response, preview)
    end

    private_class_method def self.headers(key)
      {
        'X-Vestaboard-Read-Write-Key' => key,
        'Content-Type' => 'application/json'
      }
    end

    private_class_method def self.handle_response(response, preview)
      layout_string = JSON.parse(response.body).dig('currentMessage', 'layout')
      layout = Vestabule::Layout.new(layout_string)

      puts layout.to_text if preview

      layout
    end
  end
end
