Rails.application.routes.draw do
  root 'home#index'

  get 'about'   => 'about#index'
  get 'price'   => 'price#index'
  get 'contact' => 'contact#index'
end
