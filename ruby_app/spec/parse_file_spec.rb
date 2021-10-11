# frozen_string_literal: true

require './app/classes/fetch_coindata.rb'

describe CoinData do
  let(:coin_data) { CoinData.new(payload: %w[BTC XRP ETH]) }

  before(:each) do
    stub_request(:get, %r{https://api.nomics.com/v1/currencies/ticker?*})
      .to_return(status: 200, body: '[{
      "id": "BTC",
      "currency": "BTC",
      "name": "Bitcoin",
      "price": "1"
    }, {
      "id": "ETH",
      "currency": "ETH",
      "name": "Ethereum",
      "price": "0.5"
    }]', headers: {})
  end

  it 'creates object' do
    expect(subject).to have_attributes({})
  end

  describe 'task 1' do
    let(:tast_1_output) { coin_data.task_1_output }

    it 'lists the loaded payload' do
      expect(tast_1_output).not_to be_empty
      expect(tast_1_output.first).to be_kind_of(Hash)
      expect(tast_1_output.first).to have_key('id')
    end
  end

  describe 'task 2' do
    let(:task_2) { coin_data.task_2_output(param: 'name', ticker: 'BTC') }

    it 'retreives the crypto dynamic params' do
      expect(task_2).not_to be_empty
    end
  end

  describe 'task 3' do
    let(:currency) { 'EUR' }
    let(:task_3) { coin_data.task_3_output(ticker: 'BTC', currency: 'EUR') }

    it 'retreives the crypto dynamic params' do
      expect(task_3).to be(1.0)
    end
  end

  describe 'task 4' do
    let(:task_4) { coin_data.task_4_output(compare_first: 'BTC', compare_second: 'ETH') }

    it 'retreives the crypto dynamic params' do
      expect(task_4).to be_a_kind_of(Float)
      expect(task_4).to be(2.0)
    end
  end
end
