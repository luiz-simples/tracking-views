Rails.application.routes.draw do
  root 'home#index'

  get 'about' => 'about#index'
  get 'price' => 'price#index'

  post 'contact' => 'contact#new'
  get  'contact' => 'contact#index'
  get  'contact/success' => 'contact#success', as: 'success'
  get  'contact/we-will-try' => 'contact#fail', as: 'fail'
end
