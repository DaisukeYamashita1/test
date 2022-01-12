class NonloginController < ApplicationController

    before_action :forbid_login_user
    
    def forbid_login_user
        if @current_user
            flash[:notice] = "すでにログインしています"
            redirect_to("/posts/index")
        end
    end  

end