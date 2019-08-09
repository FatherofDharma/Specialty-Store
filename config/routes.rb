Rails.application.routes.draw do
  root to: 'site_pages#home'

  resources :products do
    resources :reviews
  end
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
