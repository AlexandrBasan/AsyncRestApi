AsyncApi::Application.routes.draw do
  namespace :v1, constraints: { subdomain: 'api' } do
    resources :jobs
  end
end
