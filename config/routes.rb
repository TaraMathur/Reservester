Rails.application.routes.draw do
	
  get 'welcome/index'

  devise_for :users, :controllers => { registrations: 'registrations' }
	get 'restaurants/index'
	root 'restaurants#index'
	get 'restaurants' => 'restaurants#index'
	get 'owner_dashboard' => 'restaurants#owner_dashboard'
	get 'user_dashboard' => 'restaurants#user_dashboard'


 	resources :restaurants do
 		resources :reservations
 	end

 	resources :restaurants do
 		put :favorite, on: :member
 	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
