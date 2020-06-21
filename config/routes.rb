Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'users/sessions' }


  resources :tests, only: :index do
    resources :questions, shallow: true, only: %i[index show] do
      resources :answers, shallow: true, only: %i[index show]
    end
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end

      patch :update_inline, on: :member
    end
    resources :gists, only: %i[index]
  end
  resources :feedbacks, only: %i[new create]
end
