Rails.application.routes.draw do
  root to: "tops#index"
  resources :tops, only: [:index]
  resources :cwavetests, only: [:index, :create, :new]
  resources :exhibit
  resources :user_accounts, only: [:index], path: "mypage"
  resource :user_identifications, only: [:edit], path: "mypage/identification"
end
