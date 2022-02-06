Rails.application.routes.draw do
  root "home#index"

# Auth
  get   'signup'        ,to:  'auth#signup'
  post  'register'      ,to:  'auth#register'

  get   'signin'        ,to:  'auth#signin'
  post  'authenticate'  ,to:  'auth#authenticate'

  post  'signout'       ,to:  'auth#signout'
end
