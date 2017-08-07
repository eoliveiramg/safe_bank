Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      match '/accounts' => 'accounts#create', :via => :post
      match '/vaults' => 'vaults#create', :via => :post
      match '/money_transfers' => 'money_transfers#create', :via => :post
      match '/balances' => 'balances#index', :via => :get
    end
  end
end
