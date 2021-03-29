# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'users/sessions' }

  default_url_options host: 'testguru-mymadhead.herokuapp.com/'

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: [:index] do
        resources :answers, shallow: true, except: [:index]
      end

      patch :update_inline, on: :member
    end

    resources :gists, only: %i[index]
    resources :badges
  end

  resources :feedbacks, only: %i[new create]
  resources :badges_users, only: %i[index show]
end
