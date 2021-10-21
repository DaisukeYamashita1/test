class NonUsersController < NonloginController

  # 新規ユーザ登録
  def new
      @user = User.new
  end

  #利用規約
  def agreement
  end

  # 新規ユーザ作成
  # strong paramter を使った書き方
  # user.attribute = params
  # bootstrap で任せる　rails-bootstrap というgemがある
  def create
      @user = User.new(user_params)
      # form class 
      if @user.agreement == "ok"
          # 利用規約に同意したら（チェックがあれば）ユーザ作成
          if @user.save
              session[:user_id] = @user.id
              flash[:notice] = "ユーザー登録が完了しました"
              redirect_to("/top")
          else
              render("non_users/new")
          end
      else
          flash[:notice] = "利用規約に同意してください"
          @error_message = "利用規約に同意してください"
          render("non_users/new")
      end
  end

  # ログインフォーム用
  def login_form
  end

  # ログイン処理
  def login
      @user = User.find_by(user_name: params[:user_name], password: params[:password])
      if @user
          session[:user_id] = @user.id
          flash[:notice] = "ログインしました"
          redirect_to("/top")
      else
          @error_message = "ユーザー名 または パスワードが違います"
          @user_name = params[:user_name]
          @password = params[:password]
          render("non_users/login_form")
      end
  end 
 
  private
  def user_params
      params.require(:user).permit(:user_name, :password, :agreement)
  end
  
end