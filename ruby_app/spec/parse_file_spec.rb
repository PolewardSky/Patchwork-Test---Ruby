# frozen_string_literal: true

require './app/classes/fetch_coindata.rb'

describe CoinData do
  let(:coin_data) { CoinData.new }

  it 'creates object' do
    expect(subject).to have_attributes({})
  end

  it 'lists the loaded payload' do
    expect(coin_data.task_1_output(payload: ['BTC'])).not_to be_empty
  end
end
