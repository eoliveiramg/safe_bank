module Api
  module V1
    class MoneyTransfersController < ApplicationController
      include ActionView::Helpers::NumberHelper

      attr_reader :money_transfer, :debit_transaction, :credit_transaction

      # POST /money_transfers
      def create
        validate_source_account
        validate_destination_account

        balance = Account.balance(money_transfer_params[:source_account_id])

        if balance > money_transfer_params[:amount].to_d
          ActiveRecord::Base.transaction do
            create_debit
            create_credit
          end
          @money_transfer = TransactionFactory.build(debit_transaction, credit_transaction)

          respond_with :api, :v1, money_transfer, status: :created
        else
          render json: {
            message: 'Conta de origem não possui saldo suficiente. Transação cancelada.'
          }, status: 403
        end
      rescue ActiveRecord::RecordNotFound => e
        render json: {
          message: "Account #{e.message} does not exists. Transaction does not was complete!"
        }, status: :not_found
      end

      private

      def money_transfer_params
        # whitelist params
        params.permit(:source_account_id, :destination_account_id, :amount)
      end

      def validate_source_account
        Account.find(money_transfer_params[:source_account_id])
      rescue ArgumentError
        raise ActiveRecord::RecordNotFound => money_transfer_params[:source_account_id]
      end

      def validate_destination_account
        Account.find(money_transfer_params[:destination_account_id])
      rescue ArgumentError
        raise ActiveRecord::RecordNotFound => money_transfer_params[:destination_account_id]
      end

      def create_debit
        @debit_transaction = Vault.new(
          account_id: money_transfer_params[:source_account_id],
          value: money_transfer_params[:amount],
          type_value: 'debit'
        )

        debit_transaction.save!
      end

      def create_credit
        @credit_transaction = Vault.new(
          account_id: money_transfer_params[:destination_account_id],
          value: money_transfer_params[:amount],
          type_value: 'credit'
        )

        credit_transaction.save!
      end
    end
  end
end
