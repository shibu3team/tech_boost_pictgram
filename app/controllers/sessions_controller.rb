class SessionsController < ApplicationController
  before_action :authenticate_user, only:[:destroy, :logout]
  before_action :forbid_login_user, only:[:new, :create]


  def new
    user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, notice: "ログインに成功しました"
    else
      flash.now[:alert] = "ログインに失敗しました"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
