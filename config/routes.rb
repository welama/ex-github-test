# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'jokes#index'
  resources :jokes, only: %i[index edit create update destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
