Rails.application.routes.draw do
  root "produtos#index"

  get "produtos/search", to: "produtos#search"
  resources :produtos, only: %i[index new create destroy]
end
