class UsersController < ApplicationController

    # ↓を別コントローラに分けて、そいつを継承して作ればいちいち書かなくてよい
    before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
    before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
    before_action :ensure_correct_user, {only: [:edit, :update]}

    # myページ表示
    def show
        @user = User.find_by(id: params[:id])
    end

    # 新規ユーザ登録
    def new
        @user = User.new
    end

    # 新規ユーザ作成
    # strong paramter を使った書き方
    # user.attribute = params
    # bootstrap で任せる　rails-bootstrap というgemがある
    def create
        @user = User.new(
        email: params[:email],
        password: params[:password],
        agreement: params[:agreement]
        )
        # form class 
        if @user.agreement == "ok"
            # 利用規約に同意したら（チェックがあれば）ユーザ作成
            if @user.save
                session[:user_id] = @user.id
                flash[:notice] = "ユーザー登録が完了しました"
                redirect_to("/top")
            else
                render("users/new")
            end
        else
            flash[:notice] = "利用規約に同意してください"
            @error_message = "利用規約に同意してください"
            render("users/new")
        end
    end

    # ユーザパスワード変更
    def edit
        @user = User.find_by(id: params[:id])
    end

    # パスワード更新ボタンをクリックしたとき
    def update
        @user = User.find_by(id: params[:id])
        @user.password = params[:password]
        @user.agreement = "ok"

        if @user.save
            flash[:notice] = "パスワードを更新しました"
            redirect_to("/users/#{@user.id}")
        else
            render("users/edit")
        end
        # rescueを使った書き方
    end


    # ログインフォーム用
    def login_form
    end

    # ログイン処理
    def login
        @user = User.find_by(email: params[:email], password: params[:password])
        if @user
            session[:user_id] = @user.id
            flash[:notice] = "ログインしました"
            redirect_to("/top")
        else
            @error_message = "Incorrect email address or password"
            @email = params[:email]
            @password = params[:password]
            render("users/login_form")
        end
    end
    
    # ログアウト処理
    def logout
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        redirect_to("/login")
    end
    
    def ensure_correct_user
        if @current_user.id != params[:id].to_i
            flash[:notice] = "権限がありません"
            redirect_to("/posts/index")
        end
    end

end