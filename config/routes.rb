Rails.application.routes.draw do
  root "produtos#index"
  get "/produtos", to: "produtos#index"
end
