class UsersController < LoginController

    before_action :ensure_correct_user, except: [:logout ]

    def ensure_correct_user
        if @current_user.public_uid != params[:id]
            flash[:notice] = "権限がありません"
            redirect_to("/posts/index")
        end
    end      

    # myページ表示
    def show
        @user = User.find_by(public_uid: params[:id])
    end

    # ユーザパスワード変更
    def edit
        @user = User.find_by(public_uid: params[:id])
    end

    # パスワード更新ボタンをクリックしたとき
    def update
        @user = User.find_by(public_uid: params[:id])
        @user.password = params[:password]
        @user.agreement = "ok"

        if @user.save
            flash[:notice] = "パスワードを更新しました"
            redirect_to("/users/#{@user.public_uid}")
        else    
            render("users/edit")
        end

    end
    
    # ログアウト処理
    def logout
        session[:user_id] = nil
        flash[:notice] = "ログアウトしました"
        redirect_to("/login")
    end
    
end