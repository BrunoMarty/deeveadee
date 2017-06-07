Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  get 'admin/client' => 'admin#client'
  get 'admin/:classe/:id' => 'admin#remove'
  post 'admin/client/add' => 'admin#addclient'

  root 'main#index'
  get 'dvd/page/:page' => 'main#dvds'
  get 'dvd/cat/:id' => 'main#dvdbycat'
  get 'dvd/:id' => 'main#dvd'
  post 'dvd/comment' => 'main#addcomment'
  get 'dvd/note/:dvd/:note' => 'main#addnote'

  get 'user' => 'user#index'
  post 'user' => 'user#index'
  get 'user/create'
  post 'user/create'
  get 'user/disconnect'
  get 'user/account'
  post 'user/account' => 'user#updateaccount'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
