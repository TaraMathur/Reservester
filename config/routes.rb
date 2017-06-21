Rails.application.routes.draw do
	
  get 'welcome/index'

  devise_for :users, :controllers => { registrations: 'registrations' }
	get 'restaurants/index'
	root 'restaurants#index'
	get 'restaurants' => 'restaurants#index'
	get 'dashboard' => 'restaurants#dashboard'

   

 	resources :restaurants do
 		resources :reservations
 	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
