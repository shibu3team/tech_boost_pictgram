class PagesController < ApplicationController
  skip_before_action :authenticate_user
  before_action :forbid_login_user

  def index
  end
  def help
  end

end
