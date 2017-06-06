Rails.application.routes.draw do
  get 'user/index'

  root 'main#index'
  get 'dvd/:page' => 'main#dvd'
  get 'dvd/cat/:id', to: 'main#dvdbycat'

  get 'user' => 'user#index'
  post 'user' => 'user#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
