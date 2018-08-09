Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }







  root to: 'repos#index'

  resources :repos, except: [:index, :new]

  scope ':username' do
    get 'my-repos', to: 'users/repos#my_repos_index', as: 'my_repos'
    get 'my-collaborations', to: 'users/repos#my_collaborations_index', as: 'my_collaborations'
  end

  # delete 'collaborations/:repo_id/:user_id', to: 'collaborations#destroy', as: 'end_collaboration'
  delete 'collaborations/:repo_id', to: 'collaborations#destroy', as: 'end_collaboration'

  # post 'collaborations', to: 'collaborations#create', as: 'collaborations'
  post 'collaborations/:repo_id', to: 'collaborations#create', as: 'collaborations'

  patch 'collaborations/:id', to: 'collaborations#update'

end

