SkAssetImages::Application.routes.draw do
  root to: 'images#index'
  resources :images
  # resources :image_types
  resources :titles
  resources :celebs
end