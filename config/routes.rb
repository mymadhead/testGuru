Rails.application.routes.draw do
  get 'tests/show'
  get 'questions/new'

  resources :tests do
    resources :questions, shallow: true
  end
end
