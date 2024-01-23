# frozen_string_literal: true

class BaseApiFetcher
  BASE_URL = 'https://sample-accounts-api.herokuapp.com'

  attr_accessor :response

  def initialize(endpoint)
    @endpoint = endpoint
  end

  def call
    RestClient.get("#{BASE_URL}/#{@endpoint}")
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error("Failed to fetch #{@endpoint}: #{e.response}")
    nil
  end
end
