class PagesController < ApplicationController
  before_action :forbid_login_user

  def index
  end
  def help
  end

end
