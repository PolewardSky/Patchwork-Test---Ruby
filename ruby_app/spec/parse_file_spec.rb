# frozen_string_literal: true

require './app/classes/fetch_coindata.rb'

describe CoinData do
  let(:coin_data) { CoinData.new(payload: ['BTC']) }

  it 'creates object' do
    expect(subject).to have_attributes({})
  end
  
  describe 'task 1' do
    it 'lists the loaded payload' do
      expect(coin_data.task_1_output).not_to be_empty
    end
  end

  describe 'task 2' do
    let(:task_2) { coin_data.task_2_output(param: 'name', ticker: 'BTC') }

    it 'retreives the crypto dynamic params' do
      expect(task_2).not_to be_empty
    end
  end
end
