# frozen_string_literal: true

class FetchBalances
  BASE_URL = 'https://sample-accounts-api.herokuapp.com'

  attr_accessor :accounts_data, :balances

  def initialize(accounts_data:)
    @accounts_data = accounts_data
  end

  def call
    fetch_balances
  end

  private

  def fetch_balances
    self.balances = []

    accounts_data.each do |account|
      account_id = extract_account_id(account:)
      balance_data = fetch_balance_data(account_id:)

      balances << build_balance(balance_data:)
    end

    true
  rescue RestClient::ExceptionWithResponse => e
    handle_error(e)
    false
  end

  def extract_account_id(account:)
    account['attributes']['id']
  end

  def fetch_balance_data(account_id:)
    balance_response = RestClient.get("#{BASE_URL}/accounts/#{account_id}")
    JSON.parse(balance_response.body)['attributes']
  end

  def build_balance(balance_data:)
    { name: balance_data['name'], balance: balance_data['balance'] }
  end

  def handle_error(error)
    Rails.logger.error("Failed to fetch balances: #{error.response}")
  end
end
