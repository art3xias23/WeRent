Rails.application.routes.draw do
 

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  devise_for :users, 
  			 :path => '', 
  			 :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  			 :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
  			 				  :registrations => 'registrations'}

  			 resources :users, only: [:index, :show, :edit, :update]
  			 resources :rooms
  			 resources :pictures

  			 resources :rooms do
  			 	resources :reservations, only: [:create]
  			 end 

         resources :conversations, only: [:index, :create] do
          resources :messages, only: [:index, :create]
         end

         resources :rooms do
          resources :reviews, only: [:create, :destroy]
         end 

         get '/preload' => 'reservations#preload'
         get '/preview' => 'reservations#preview'

         get '/your_trips' => 'reservations#your_trips'
         get '/your_reservations' => 'reservations#your_reservations'
         get '/search' => 'static_pages#search'

        post '/notify' => 'reservations#notify'
        post '/your_trips' => 'reservations#your_trips'
end
