Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

 root to: 'items#index'


 resources :users, only:[:show, :edit, :update]
 resources :items, only:[:index,:show]
 resources :sub_addresses, only:[:index, :new, :edit, :create, :destroy]

 namespace :admins do
  get "/users/:id",:to=>"users#show"
	resources :users
	resources :items
 end
 get '/admins_top' => 'admins#top'



namespace :admins do
 get "/users/:id",:to=>"users#show"
end

 get 'items/search/:id', to: 'items#search_genre', as: :search_genre

end


