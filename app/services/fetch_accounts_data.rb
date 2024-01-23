class FetchAccountsData
  BASE_URL = 'https://sample-accounts-api.herokuapp.com'

  attr_accessor :user_id, :accounts_data

  def initialize(user_id:)
    @user_id = user_id
  end

  def call
    fetch_accounts_data
  end

  private

  def fetch_accounts_data
    accounts_data_response = RestClient.get("#{BASE_URL}/users/#{user_id}/accounts")
    self.accounts_data = JSON.parse(accounts_data_response.body)
    true
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error("Failed to fetch accounts data: #{e.response}")
    false
  end
end
