# frozen_string_literal: true

class FetchUserData < BaseApiFetcher
  attr_accessor :user_id, :user_name, :account_ids

  def initialize(user_id:)
    super("users/#{user_id}")
  end

  private

  def handle_response
    self.user_name = response_data.dig('attributes', 'name')
    self.account_ids = response_data.dig('attributes', 'account_ids')
  end
end
