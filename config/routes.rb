Rails.application.routes.draw do
 

  root 'static_pages#home'

  devise_for :users, 
  			 :path => '', 
  			 :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  			 :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
  			 				  :registrations => 'registrations'}

  			 resources :users, only: [:show]
  			 resources :rooms
  			 resources :pictures

  			 resources :rooms do
  			 	resources :reservations, only: [:create]
  			 end 

         get '/preload' => 'reservations#preload'
         get '/preview' => 'reservations#preview'
end
