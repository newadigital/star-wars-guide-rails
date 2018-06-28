Rails.application.routes.draw do
  get 'welcome/index'

  resources :films
  get 'films' => 'films#index'
  get 'films/:id' => 'films#show'

  resources :characters
  get 'characters' => 'characters#index'
  get 'characters/:uri' => 'characters#show'

  resources :vehicles
  get 'vehicles' => 'vehicles#index'
  get 'vehicles/:id' => 'vehicles#show'

  resources :starships
  get 'starships' => 'starships#index'
  get 'starships/:id' => 'starships#show'

  resources :planets
  get 'planets' => 'planets#index'
  get 'planets/:id' => 'planets#show'

  resources :api do
    resources :films, :starships, :vehicles, :starships, :planets
  end
  get 'api' => 'api#index'
  get 'api/films/:id' => 'api#get_film'
  get 'api/characters/:id' => 'api#get_person'
  get 'api/starships/:id' => 'api#get_starship'
  get 'api/planets/:id' => 'api#get_planet'
  get 'api/vehicles/:id' => 'api#get_vehicle'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end