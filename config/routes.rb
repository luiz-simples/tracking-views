Rails.application.routes.draw do
  root 'home#index'

  get 'about'   => 'about#index'
  get 'price'   => 'price#index'
  get 'contact' => 'contact#index'
  get 'admin'   => 'contact#find'

  get 'activities/:cid' => 'contact#activities', as: :activities
end
