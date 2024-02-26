# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :tasks, except: [:show] do
      member do
        post :assign
        put :progress
      end
    end

    resources :users do
      member do
        get :tasks
      end
    end

    get '/tasks/overdue', to: 'tasks#overdue'
    get '/tasks/status/:status', to: 'tasks#by_status'
    get '/tasks/completed', to: 'tasks#completed'
    get '/tasks/statistics', to: 'tasks#statistics'
  end
end
