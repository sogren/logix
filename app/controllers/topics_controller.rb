class TopicsController < ApplicationController
  before_filter :require_login, only: [:new, :create]
  expose(:topics) { Topic.order(created_at: :desc) }
  expose(:topic)

  def index
  end

  def show
    topic.update(counter: topic.counter + 1)
  end

  def create
    topic = current_user.topics.build(topic_params)
    if topic.save
      flash[:info] = 'Topic created!'
      redirect_to topic
    else
      flash[:danger] = 'Topic creation failed!'
      redirect_to topics_path
    end
  end

  private

    def topic_params
      params.require(:topic).permit(:title)
    end
end
