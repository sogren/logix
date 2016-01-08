class UsersController < ApplicationController
  before_filter(only: [:account]) { require_login(root_path) }
  expose(:users)
  expose(:user)

  def show
  end

  def index
  end

  def account
  end
end
