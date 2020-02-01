Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resource  :token, only: :create

    resources :users

    resources :wines do
      resources :reviews
    end

    resources :wineries
  end
end
