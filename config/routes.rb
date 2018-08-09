Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  root to: 'repos#index'

  resources :repos, only: [:show]

  post '/repos', to: 'users/repos#create', as: 'repos'
  get '/repos/:id/edit', to:'user/repos#edit', as: 'edit_repo'
  patch '/repos/:id', to: 'user/repos#update'
  put '/repos/:id', to: 'user/repos#update'
  delete '/repos/:id', to: 'user/repos#destroy'

  scope ':username' do
    get 'my-repos', to: 'users/repos#my_repos_index', as: 'my_repos'
    get 'my-collaborations', to: 'users/repos#my_collaborations_index', as: 'my_collaborations'
  end

  delete 'collaborations/:repo_id/:user_id', to: 'collaborations#destroy', as: 'end_collaboration'

  post 'collaborations', to: 'collaborations#create', as: 'collaborations'

  patch 'collaborations/:id', to: 'collaborations#update'

end

