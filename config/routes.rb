# frozen_string_literal: true

Rails.application.routes.draw do
  resources :layouts
  # RESTful routes
  resources :sections, except: %i[new edit]

  # even though templates will be static resource, still need
  # a way to create/update, so might as well implement full CRUD
  # so I can use curl scripts
  resources :templates, except: %i[new edit]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'

  get '/resumes/:user_id/:layout_name' => 'resumes#show'
end
