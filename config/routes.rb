Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/team', to: 'team#team'
  get '/contact', to: 'contact#contact'
 
  get '/home', to: 'home#home'
  get '/show_gossip', to: 'show_gossip#show_gossip'
  get '/create_gossip', to: 'create_gossip#create_gossip'

  # Defines the root path route ("/")
  # root "posts#index"
end
