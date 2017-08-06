module Api
  module V1
    class VaultsController < ApplicationController
      attr_reader :vault

      # POST /vaults
      def create
        @vault = VaultFactory.build(vault_params)
        vault.save!

        respond_with :api, :v1, vault, status: :created
      end

      private

      def vault_params
        # whitelist params
        params.permit(:value, :type_value, :account_id)
      end
    end
  end
end
