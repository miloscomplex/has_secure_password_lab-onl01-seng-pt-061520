Rails.application.routes.draw do
  get 'sessions/login'

  post 'sessions/create'

  get 'sessions/logout'

  get 'users/new'

  post 'users/create'

  get 'homepage/:id', to: 'users#homepage', as: 'homepage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
