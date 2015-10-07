Rails.application.routes.draw do
   resources :labels, only: [:show]

 resources :topics do
   resources :posts, except: [:index]
 end
 
 # #4
   resources :posts, only: [] do
 # #5
     resources :comments, only: [:create, :destroy]
     resources :favorites, only: [:create, :destroy]
     
     post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote     
   end
   
 resources :users, only: [:new, :create, :show] 
 resources :sessions, only: [:new, :create, :destroy]
 get 'about' => 'welcome#about'
 

 root to:'welcome#index'
 
 # #19
   namespace :api do
     namespace :v1 do
       resources :users, only: [:index, :show]
       resources :topics, only: [:index, :show]       
     end
   end
end
