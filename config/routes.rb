SkAssetImages::Application.routes.draw do
  root to: 'images#index'
  resources :images

  resources :titles
  resources :celebs
end