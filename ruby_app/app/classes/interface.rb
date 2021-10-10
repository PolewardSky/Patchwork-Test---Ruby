# frozen_string_literal: true

require './app/classes/fetch_coindata.rb'

ARGV.each do
  puts 'Task 1'
  payload = %w[BTC XRP ETH]
  cd = CoinData.new(payload: payload)
  puts cd.task_1_output

  puts 'Task 2'
  puts 'Please provide dynamic param to download e.g. [circulating_supply, max_supply, name, symbol, price]' # rubocop:disable Layout/LineLength
  param = STDIN.gets.chomp
  puts 'Please provide crypto ticker name to view e.g. [ETH, BTC]'
  ticker = STDIN.gets.chomp
  puts cd.task_2_output(param: param, ticker: ticker)

  puts 'Task 3'
  puts 'Convert currency to FIAT value?'
  puts 'What coin\'s value do you want to see? e.g. BTC'
  ticker = STDIN.gets.chomp
  puts 'What FIAT currency do you want to show the currency in? e.g. GBP'
  currency = STDIN.gets.chomp
  puts cd.task_3_output(ticker: ticker, currency: currency)

  puts 'Task 4'
  puts 'Compare the dollar values of 2 cryptos'
  puts 'First crypto e.g. BTC'
  compare_first = STDIN.gets.chomp
  puts 'Second crypto e.g. ETH'
  compare_second = STDIN.gets.chomp
  puts "1 #{compare_first} == #{cd.task_4_output(compare_first: compare_first, compare_second: compare_second)}#{compare_second}" # rubocop:disable Layout/LineLength
end

puts 'Test complete'
