Rails.application.routes.draw do
	
  devise_for :owners
	get 'restaurants/index'
  	root 'restaurants#index'
 	get 'restaurants' => 'restaurants#index'

 	resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
