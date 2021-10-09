# frozen_string_literal: true

require './app/classes/fetch_coindata.rb'

ARGV.each do
  puts 'Task 1'
  payload = %w[BTC XRP ETH]
  cd = CoinData.new
  puts cd.task_1_output(payload: payload)

  puts 'Please provide dynamic param to download'
  params = STDIN.gets.chomp
  puts 'Please provide crypto ticker name to view'
  ticker = STDIN.gets.chomp

  puts 'Task 2'
  puts cd.task_2_output(params: params, ticker: ticker)

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
