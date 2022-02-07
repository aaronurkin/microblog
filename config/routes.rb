Rails.application.routes.draw do
  root "home#index"

# Auth
  get   'signup'              ,to:  'auth#signup'
  post  'register'            ,to:  'auth#register'

  get   'signin'              ,to:  'auth#signin'
  post  'authenticate'        ,to:  'auth#authenticate'

  post  'signout'             ,to:  'auth#signout'

# User
  get     'users/:id'         ,to:  'user#show'         ,as: :user
  get     'users/:id/edit'    ,to:  'user#edit'         ,as: :edit_user
  post    'users/:id/update'  ,to:  'user#update'       ,as: :update_user
  delete  'users/:id/destroy' ,to:  'user#destroy'      ,as: :destroy_user
end
