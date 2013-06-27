SkAssetImages::Application.routes.draw do
  root to: 'titles#index'
  resources :titles
end
