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


 resources :users, only:[:show, :edit, :update]

 resources :items, only:[:index,:show]
 resources :sub_addresses, only:[:index, :new, :edit, :create]

 get 'items/search/:id', to: 'items#search_genre', as: :search_genre

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
