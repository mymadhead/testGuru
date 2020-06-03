Rails.application.routes.draw do
  get 'tests/show'
  get 'questions/new'
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end
end
