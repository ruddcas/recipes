Rails.application.routes.draw do
# For details on the DSL available within this file, 
# see https://guides.rubyonrails.org/routing.html
# Prefix - Verb - URI - Controller#Action
	
	root "pages#home"
	get 'pages', to: 'pages#home'
	get 'pages/home', to: 'pages#home'

	resources :recipes

end
