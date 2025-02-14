Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout},
             controllers: { sessions: 'users/sessions' }
  
  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
      resources :tests do
        resources :questions, shallow: true do
          resources :answers, shallow: true
        end
      end
  end

end
