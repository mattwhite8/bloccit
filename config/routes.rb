Rails.application.routes.draw do
 
  get 'summaries/new'

  get 'summaries/show'

  devise_for :users
  resources :topics do
    resources :posts, except: [:index]
  end
  resources :summaries

  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  
  root to: 'welcome#index'

 
end
