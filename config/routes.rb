# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, :controllers => { :comfirmations => "comfirmations" }
  scope :api do
    scope :v1 do
      resources :products, except: [:new, :edit]
      resources :reviews, except: [:new, :edit]
      resources :recommendations, except: [:new, :edit]
      resources :notes, except: [:new, :edit]
    end
  end
  get '/s3/sign' => 's3#sign', :as => 's3_sign'
  get '/s3/sign_image' => 's3#sign_image', :as => 's3_sign_image'

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
