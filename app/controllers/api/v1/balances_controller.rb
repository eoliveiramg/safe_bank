module Api
  module V1
    class BalancesController < ApplicationController
      attr_reader :balance

      # GET /balances
      def index
        validate_account

        @balance = BalanceFactory.build(
          Account.balance(params[:account_id]),
          balance_params
        )

        respond_with :api, :v1, balance, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { message: "Account does not existe" }, status: :not_found
      end

      private

      def balance_params
        # whitelist params
        params.permit(:account_id)
      end

      def validate_account
        Account.find(balance_params[:account_id])
      rescue ArgumentError
        raise ActiveRecord::RecordNotFound
      end
    end
  end
end
