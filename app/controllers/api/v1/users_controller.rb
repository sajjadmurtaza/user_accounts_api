# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def show
        user_account_service = UserAccountService.new(user_id: params[:id])

        if user_account_service.call
          render json: user_account_service.user_account_info
        else
          render json: { error: 'Failed to fetch user account information' }, status: :unprocessable_entity
        end
      end
    end
  end
end
