Rails.application.routes.draw do
  root "produtos#index"

  resources :produtos, only: %i[index new create destroy]
end
