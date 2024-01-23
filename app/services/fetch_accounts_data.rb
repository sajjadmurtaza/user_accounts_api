# frozen_string_literal: true

class FetchAccountsData < BaseApiFetcher
  attr_accessor :user_id, :accounts_data

  def initialize(user_id:)
    super("users/#{user_id}/accounts")
  end

  private

  def handle_response
    self.accounts_data = response_data
  end
end
