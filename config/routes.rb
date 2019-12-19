Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :userprofile, only: [:edit]
  resources :cwavetests, only: [:index, :create, :new]
  resources :user_accounts, only: [:index], path: "/mypage" do
    collection do
      get :logout
    end
  end
  resources :card_registrations, only: [:index, :new], path: "/mypage/card"
  resources :signup, only: [:new, :create] do
    collection do
      get :step1
    end

  end

  resources :products, only: [:show, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'js' }
      get 'get_category_grandchildren', defaults: { format: 'js' }
    end
    resources :purchases, only: [:index] do
      collection do
        post :pay
      end
    end
  end
end
