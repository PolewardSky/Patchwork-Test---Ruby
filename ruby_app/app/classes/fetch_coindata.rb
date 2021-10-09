# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

# Receive and parse file outputs
class CoinData
  API_KEY = '38f1ded0d6e9d90c81b274ccccdabe9bf320ab6f'.freeze

  def initialize
  end

  def task_1_output(payload: [])
    puts uri = URI("https://api.nomics.com/v1/currencies/ticker?key=#{API_KEY}&ids=#{payload.join(',')}&interval=1d&convert=USD&per-page=100&page=1")
    res = Net::HTTP.get_response(uri)
    res.body if res.is_a?(Net::HTTPSuccess)
  end
end
