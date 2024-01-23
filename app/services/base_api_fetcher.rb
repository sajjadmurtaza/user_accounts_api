# frozen_string_literal: true

class BaseApiFetcher
  BASE_URL = 'https://sample-accounts-api.herokuapp.com'

  attr_accessor :response_data

  def initialize(resource_path)
    @resource_path = resource_path
  end

  def call
    fetch_data
  end

  private

  def fetch_data
    # we can also cache the response here

    response = RestClient.get("#{BASE_URL}/#{@resource_path}")
    self.response_data = JSON.parse(response.body)
    handle_response
  rescue RestClient::ExceptionWithResponse => e
    handle_error(e.response)
  end

  def handle_response
    raise NotImplementedError, 'Subclasses must implement the handle_response method.'
  end

  def handle_error(response)
    Rails.logger.error("Failed to fetch data: #{response}")
  end
end
