# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

# Receive and parse file outputs
class CoinData
  API_KEY = '38f1ded0d6e9d90c81b274ccccdabe9bf320ab6f'.freeze

  attr_accessor :payload, :tickers_data

  def initialize(payload: [])
    @payload = payload
  end
  
  def task_1_output
    call_api(payload: @payload)
    @tickers_data
  end
  
  def task_2_output(param: '', ticker: '')
    call_api(payload: @payload)
    tick = get_ticker(ticker)
    tick[param]
  end
  
  def task_3_output(ticker: '', currency: '')
    call_api(payload: @payload, currency: currency)
    tick = get_ticker(ticker)
    tick['price']
  end
  
  def task_4_output(compare_first: '', compare_second: '')
    call_api(payload: @payload)
    tick_1 = get_ticker(compare_first)
    tick_2 = get_ticker(compare_second)
    (tick_1['price'].to_f / tick_2['price'].to_f).round(2)
  end
  
  private
  
  def call_api(payload: [], currency: 'USD')
    uri = URI("https://api.nomics.com/v1/currencies/ticker?key=#{API_KEY}&ids=#{payload.join(',')}&interval=1d&convert=#{currency}&per-page=100&page=1")
    res = Net::HTTP.get_response(uri)
    @tickers_data = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
  end
  
  def get_ticker(ticker)
    @tickers_data.select { |x| x['id'] == ticker }.first
  end
end
