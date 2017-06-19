Rails.application.routes.draw do
	
  get 'welcome/index'

  resources :users
  devise_for :owners
	get 'restaurants/index'
  	root 'welcome#index'
 	get 'restaurants' => 'restaurants#index'
 	get 'dashboard' => 'restaurants#dashboard'

  devise_for :users, :controllers => { registrations: 'registrations' }

 	resources :restaurants do
 		resources :reservations
 	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
