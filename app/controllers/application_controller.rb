# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate

  private

  def authenticate
    token = request.headers['Authorization'] == 'moneyForwardApiToken'

    render json: { error: 'Unauthorized' }, status: :unauthorized unless token
  end
end
