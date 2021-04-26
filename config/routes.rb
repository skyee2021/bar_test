Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create] do
    collection do
      get :sign_up, action: 'new'
      # get :sign_in, action: 'new'
      #可以放在同一個裡面。
    end
  end

  resources :sessions, path: 'users', only: [] do
    collection do
      get :sign_in, action: 'new' #登入
      post :sign_in, action: 'create'
      delete :sign_out, action: 'destroy' #登出
    end
  end 


  
  
  
  resources :bars do
    member do
      post :pocket_list #bars#pocket_list
    end
    resources :comments, shallow: true, only: [:create, :destroy] #代替下面兩行
    # resources :comments, only: [:index, :new, :create]
  end
  # resources :comments, except: [:index, :new, :create]
  #在外測做編輯（網址就不會秀出餐廳）
  root 'bars#index'
end
