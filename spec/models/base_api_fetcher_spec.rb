# frozen_string_literal: true

require 'rails_helper'
require 'base_api_fetcher'

describe BaseApiFetcher do
  let(:resource_path) { 'example_path' }
  let(:base_url) { 'https://sample-accounts-api.herokuapp.com' }
  let(:fetcher) { described_class.new(resource_path) }

  before do
    stub_request(:get, "#{base_url}/#{resource_path}")
      .to_return(body: '{"key": "value"}', status: 200, headers: { 'Content-Type' => 'application/json' })
  end

  describe '#call' do
    it 'fetches data from the API' do
      expect { fetcher.call }.to raise_error(NotImplementedError)
      expect(fetcher.response_data).to eq('key' => 'value')
    end
  end

  describe '#handle_response' do
    it 'raises NotImplementedError' do
      expect { fetcher.send(:handle_response) }.to raise_error(NotImplementedError)
    end
  end

  describe '#handle_error' do
    it 'logs error information' do
      allow(Rails.logger).to receive(:error)
      response = double('Response', body: 'Error message', code: 500)
      fetcher.send(:handle_error, response)
      expect(Rails.logger).to have_received(:error).with("Failed to fetch data: #{response}")
    end
  end
end
