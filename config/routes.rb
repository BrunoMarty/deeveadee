Rails.application.routes.draw do
  get 'user/index'

  root 'main#index'
  get 'dvd/page/:page' => 'main#dvds'
  get 'dvd/cat/:id' => 'main#dvdbycat'
  get 'dvd/:id' => 'main#dvd'
  post 'dvd/comment' => 'main#addcomment'

  get 'user' => 'user#index'
  post 'user' => 'user#index'
  get 'user/create' => 'user#create'
  post 'user/create' => 'user#create'
  get 'user/disconnect' => 'user#disconnect'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
