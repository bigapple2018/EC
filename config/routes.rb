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

 	resources :users

 	resources :items

 end


 get '/admins_top' => 'admins#top'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
