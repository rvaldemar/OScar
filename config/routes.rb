Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :repos, except: [:index, :new]

  scope ':username' do
    get 'my-repos', to: 'user/repos#my_repos_index', as: 'my_repos'
    get 'my-collaborations', to: 'user/repos#my_collaborations_index', as: 'my_collaborations'
  end

  delete 'collaborations/:repo_id/:user_id', to: 'collaborations#destroy', as: 'end_collaboration'

  post 'collaborations', to: 'collaborations#create', as: 'collaborations'

  patch 'collaborations/:id', to: 'collaborations#update', as: 'collaboration'

end

