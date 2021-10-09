# frozen_string_literal: true

require './app/classes/fetch_coindata.rb'

ARGV.each do
  puts 'Task 1'
  payload = %w[BTC XRP ETH]
  cd = CoinData.new(payload: payload)
  puts cd.task_1_output

  puts 'Task 2'
  puts 'Please provide dynamic param to download e.g. [circulating_supply, max_supply, name, symbol, price]'
  param = STDIN.gets.chomp
  puts 'Please provide crypto ticker name to view e.g. [ETH, BTC]'
  ticker = STDIN.gets.chomp
  puts cd.task_2_output(param: param, ticker: ticker)

  puts 'Task 3'
  puts 'What currency shall we show the crypto in?'
  currency = STDIN.gets.chomp
  puts cd.task_3_output(currency: currency)

  puts 'Task 4'
  puts 'What currency shall we compare the crypto to?'
  compare = STDIN.gets.chomp
  puts cd.task_4_output(compare: compare)
end

puts 'Processing complete'
