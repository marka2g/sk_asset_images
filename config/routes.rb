SkAssetImages::Application.routes.draw do
  root to: 'images#index'
  resources :images

  # root to: 'celebs#index'
  # root to: 'titles#index'
  resources :titles
  resources :celebs
end