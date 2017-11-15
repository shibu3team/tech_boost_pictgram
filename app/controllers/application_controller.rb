class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user


#ログインしているユーザーのセッション取得
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


#ログインしていない場合の操作を制限
  def authenticate_user
    if current_user.nil?
      flash[:notice] = "ログインが必要です"
      redirect_to login_path
    end
  end

#ログインしている場合の操作を制限
  def forbid_login_user
    if current_user
      flash[:notice] = "すでにログインしています"
      redirect_to topics_path
    end
  end

  def logged_in?
    !current_user.nil?
  end

end
