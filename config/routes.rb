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

 resources :users, only:[:show]
 resources :items, only:[:index,:show]
 resources :sub_addresses, only:[:index, :new, :edit, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
