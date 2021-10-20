class BeforeActionController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :edit, :update]
  before_action :forbid_login_user, only: [:new, :create, :login_form, :login, :agreement]
  before_action :ensure_correct_user, only: [:edit, :update]

  def ensure_correct_user
    if @current_user.public_uid != params[:id]
        flash[:notice] = "権限がありません"
        redirect_to("/posts/index")
    end
  end

  def forbid_login_user
    if @current_user
        flash[:notice] = "すでにログインしています"
        redirect_to("/posts/index")
    end
  end  

end