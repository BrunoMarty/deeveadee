Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  get 'admin/client' => 'admin#client'
  get 'admin/:classe/:id' => 'admin#remove'
  get 'admin/categorie'
  get 'admin/societe'
  get 'admin/acteur'
  get 'admin/dvd'
  get 'admin/security'
  get 'admin/disconnect'

  post 'admin/categorie/add' => 'admin#addcategorie'
  post 'admin/client/add' => 'admin#addclient'
  post 'admin/societe/add' => 'admin#addsociete'
  post 'admin/acteur/add' => 'admin#addacteur'
  post 'admin/dvd/add' => 'admin#adddvd'
  post 'admin/security' => 'admin#verifco'
  post 'admin/jsoncat' => 'admin#autocompletecat'
  post 'admin/jsonact' => 'admin#autocompleteact'
  post 'admin/jsonsoc' => 'admin#autocompletesoc'


  root 'main#index'
  get 'dvd/page/:page' => 'main#dvds'
  get 'dvd/cat/:id' => 'main#dvdbycat'
  get 'dvd/:id' => 'main#dvd'
  get 'dvd/note/:dvd/:note' => 'main#addnote'

  post 'dvd/comment' => 'main#addcomment'

  get 'user' => 'user#index'
  get 'user/create'
  get 'user/disconnect'
  get 'user/account'

  post 'user/create'
  post 'user' => 'user#index'
  post 'user/account' => 'user#updateaccount'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
