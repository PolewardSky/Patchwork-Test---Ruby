# frozen_string_literal: true

require './app/classes/fetch_coindata.rb'

describe CoinData do
  let(:coin_data) { CoinData.new(payload: ['BTC']) }
  let(:coin_data_invalid_data) { CoinData.new(payload: '') }

  it 'creates object' do
    expect(subject).to have_attributes({})
  end

  it 'lists the loaded payload' do
    expect(coin_data.payload).to eq('app/files/webserver.log')
  end
end
