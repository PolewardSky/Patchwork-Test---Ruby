# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

# Receive and parse file outputs
class CoinData
  API_KEY = '38f1ded0d6e9d90c81b274ccccdabe9bf320ab6f'.freeze

  attr_accessor :tickers_data

  def initialize(payload: [])
    uri = URI("https://api.nomics.com/v1/currencies/ticker?key=#{API_KEY}&ids=#{payload.join(',')}&interval=1d&convert=USD&per-page=100&page=1")
    res = Net::HTTP.get_response(uri)
    @tickers_data = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
  end

  def task_1_output
    @tickers_data
  end

  def task_2_output(param: '', ticker: '')
    tick = @tickers_data.select { |x| x['id'] == ticker }.first
    tick[param]
  end
end
