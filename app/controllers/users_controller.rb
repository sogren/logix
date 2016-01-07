class UsersController < ApplicationController
  before_filter :require_log_out, only:[:new, :create]
  expose(:user)

  def create
    redirect_to root_path
  end

  def index
    redirect_to root_path
  end
end
