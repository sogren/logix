class TopicsController < ApplicationController
  before_filter :require_login, only: [:new, :create]
  expose(:topics)
  expose(:topic)

  def index

  end

  def show
  end


  def create
    if topic.save
      flash[:info] = 'Topic created!'
      redirect_to topic_path(topic)
    else
      flash[:danger] = 'Topic creation failed!'
      redirect_to topics_path
    end
  end

  private

    def require_login
      unless user_signed_in?
        flash[:danger] = 'You cannot do this!'
        redirect_to topics_path
      end
    end
end
