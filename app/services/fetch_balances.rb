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
      account_id = account['attributes']['id']
      balance_response = RestClient.get("#{BASE_URL}/accounts/#{account_id}")
      balance_data = JSON.parse(balance_response.body)['attributes']
      balances << { name: balance_data['name'], balance: balance_data['balance'] }
    end

    true
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error("Failed to fetch balances: #{e.response}")
    false
  end
end
