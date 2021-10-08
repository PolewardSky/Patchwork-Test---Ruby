# frozen_string_literal: true

require './app/classes/fetch_coindata.rb'

ARGV.each do
  puts 'Task 1'
  payload = %w[BTC XRP ETH]
  cd = CoinData.new(payload: payload)
  puts cd.task_1_output

  puts 'Please provide dynamic param to download'
  params = gets
  puts 'Please provide crypto ticker name to view'
  ticker = gets

  puts 'Task 2'
  puts cd.task_2_output(params: params.chomp, ticker: ticker.chomp)

  puts 'Task 3'
  puts 'What currency shall we show the crypto in?'
  currency = gets
  puts cd.task_3_output(currency: currency.chomp)

  puts 'Task 4'
  puts 'What currency shall we compare the crypto to?'
  compare = gets
  puts cd.task_4_output(compare: compare.chomp)
end

puts 'Processing complete'
