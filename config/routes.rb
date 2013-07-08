SkAssetImages::Application.routes.draw do
  resources :images

  resources :titles do
  	resources :images
  end
  resources :celebs do
  	resources :images
  end

	root to: 'titles#index'

end