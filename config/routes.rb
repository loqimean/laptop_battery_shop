Rails.application.routes.draw do
  root to: "home#index"
  get "home/search"

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  get "pay", to: "payments#create", as: "pay"

  resources :cart, only: [:index, :destroy]

  resources :products, only: [:index, :show] do
    member do
      resource :cart, only: :update do
        [:add, :remove, :update_amount].each do |action|
          post action, to: "cart#update", as: "#{action}_product_in", defaults: { action_type: action }
        end
      end
    end
  end

  get :about, to: "home#about"

  get :thanks_for_payment, to: "home#thanks_for_payment"

  resources :orders
end
