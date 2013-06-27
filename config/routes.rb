SkAssetImages::Application.routes.draw do
  root to: 'titless#index'
  resources :titles
end
