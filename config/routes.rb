Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  get 'admin/client' => 'admin#client'
  get 'admin/:classe/:id' => 'admin#remove'
  post 'admin/client/add' => 'admin#addclient'
  get 'admin/categorie'
  post 'admin/categorie/add' => 'admin#addcategorie'
  get 'admin/societe'
  post 'admin/societe/add' => 'admin#addsociete'
  get 'admin/acteur'
  post 'admin/acteur/add' => 'admin#addacteur'
  get 'admin/dvd'
  post 'admin/dvd/add' => 'admin#adddvd'

  post 'admin/jsoncat' => 'admin#autocompletecat'
  post 'admin/jsonact' => 'admin#autocompleteact'
  post 'admin/jsonsoc' => 'admin#autocompletesoc'


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
