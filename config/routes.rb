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

  #
  get '/' => 'contents#top'
  get 'top' => 'contents#top'
  get 'contents/top' => 'contents#top'

  get "/login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  post "users/:id/update" => "users#update"

  # idを表示するのがまずい
  get "users/:id/edit" => "users#edit"

  post "users/create" => "users#create"

  get "/signup" => "users#new"

  # idを表示するのがまずい
  # resources resource onlyオプションで制御
  get "users/:id" => "users#show"

  # 上記どれにも引っかからない場合
  get '*path', controller: 'application', action: 'render_404'

end
