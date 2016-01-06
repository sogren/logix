class UsersController < ApplicationController
  expose(:user)

  def create
    redirect_to root_path
  end

  def index
    redirect_to root_path
  end
end
