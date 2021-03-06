Rails.application.routes.draw do
  root 'projects#index'
  get 'static_pages/home'
  resources :projects, only: [:index, :show, :create, :destroy] do
    resources :tasks, only: [:create, :edit, :update, :destroy] do
      member do
        patch :complete
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
