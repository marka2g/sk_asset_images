SkAssetImages::Application.routes.draw do
	root to: 'galleries#index'
  resources :images

  resources :titles do
  	resources :images
  end
  resources :celebs do
  	resources :images
  end
end