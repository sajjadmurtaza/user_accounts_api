class UserAccountService
  attr_accessor :user_id, :user_name, :account_ids, :accounts_data, :balances

  def initialize(user_id:)
    @user_id = user_id
  end

  def call
    fetch_user_data &&
      fetch_accounts_data &&
      fetch_balances
  end

  def user_account_info
    {
      name: user_name,
      account_list: balances
    }
  end

  private

  def fetch_user_data
    user_data_service = FetchUserData.new(user_id: user_id)
    self.user_name = user_data_service.user_name if user_data_service.call
  end

  def fetch_accounts_data
    accounts_data_service = FetchAccountsData.new(user_id: user_id)
    self.accounts_data = accounts_data_service.accounts_data if accounts_data_service.call
  end

  def fetch_balances
    balances_service = FetchBalances.new(accounts_data: accounts_data)
    self.balances = balances_service.balances if balances_service.call
  end
end
