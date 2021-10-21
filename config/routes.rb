Rails.application.routes.draw do

  # コンテンツ用ルーティング
  get '/contents/first' => '/contents/first'
  get '/contents/account' => '/contents/account'
  get '/contents/first_security' => '/contents/first_security'
  get '/contents/vpc' => '/contents/vpc'
  get '/contents/securitygroup' => '/contents/securitygroup'
  get '/contents/ec2' => '/contents/ec2'
  get '/contents/rds' => '/contents/rds'
  get '/contents/ec2_deploy' => '/contents/ec2_deploy'
  get '/contents/wordpress' => '/contents/wordpress'
  get '/contents/alb' => '/contents/alb'
  get '/contents/domain' => '/contents/domain'
  get '/contents/hostzone' => '/contents/hostzone'
  get '/contents/s3' => '/contents/s3'
  get '/contents/lambda' => '/contents/lambda'
  get '/contents/deleteresource' => '/contents/deleteresource'
  get '/contents/cfn' => '/contents/cfn'
  get '/contents/others' => '/contents/others'

  #resources 
  #レンダーにする
  #コンテンツテーブルのコンテンツ名

  get '/' => 'contents#top'
  get 'top' => 'contents#top'
  get 'contents/top' => 'contents#top'

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

end
