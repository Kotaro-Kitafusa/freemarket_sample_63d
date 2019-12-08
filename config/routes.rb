Rails.application.routes.draw do
  resources  :cwavetests, only: [:index, :create, :new]
  resources :product do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_shipping_method'
    end
  end
end
