module Api
  module V1
    class AccountsController < ApplicationController
      attr_reader :account

      # POST /accounts
      def create
        @account = AccountFactory.build(account_params)
        account.save!

        respond_with :api, :v1, account, status: :created
      end

      private

      def account_params
        # whitelist params
        params.permit(:name)
      end
    end
  end
end
