Rails.application.routes.draw do
  root 'home#index'

  get 'about' => 'about#index'
  get 'price' => 'price#index'

  post 'contact'  => 'contact#new'
  get  'contact'  => 'contact#index'
  get  'contacts' => 'contact#find'
  get  'contact/success' => 'contact#success', as: 'success'
  get  'contact/we-will-try' => 'contact#fail', as: 'fail'

  post 'actions' => 'activity#new'
  get 'actions/:email' => 'activity#find'
end
