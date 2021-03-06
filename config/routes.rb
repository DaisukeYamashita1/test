Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/contents/awswords' => 'contents#awswords'
  get '/' => 'non_users#lp'
  get 'top' => 'contents#top'
  get 'contents/top' => 'contents#top'
  get 'contents/:id' => 'contents#show'

  get "/login" => "non_users#login_form"
  post "login" => "non_users#login"
  post "logout" => "users#logout"

  post "users/:id/update" => "users#update"

  get "users/:id/edit" => "users#edit"

  post "non_users/create" => "non_users#create"

  get "/signup" => "non_users#new"

  #利用規約
  get "/agreement" => "non_users#agreement"

  # resources resource onlyオプションで制御
  get "users/:id" => "users#show"

  # 上記どれにも引っかからない場合
  get '*path', controller: 'application', action: 'render_404'
<<<<<<< HEAD
   
=======

  # 500等のエラーをログに出す処理を追加
  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'

>>>>>>> origin/main
end
