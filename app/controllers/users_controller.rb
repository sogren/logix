class UsersController < ApplicationController
  before_filter :require_log_out, only:[:new, :create]
  expose(:user)

  def show
  end

  def index
  end

  def account
  end
end
