class FetchUserData
  BASE_URL = 'https://sample-accounts-api.herokuapp.com'

  attr_accessor :user_id, :user_name, :account_ids

  def initialize(user_id:)
    @user_id = user_id
  end

  def call
    fetch_user_data
  end

  private

  def fetch_user_data
    user_data_response = RestClient.get("#{BASE_URL}/users/#{user_id}")
    user_data = JSON.parse(user_data_response.body)['attributes']
    self.user_name = user_data['name']
    self.account_ids = user_data['account_ids']
    true
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.error("Failed to fetch user data: #{e.response}")
    false
  end
end
