class TopicsController < ApplicationController
  before_filter(only: [:new, :create]) { require_login(topics_path) }
  expose(:new_topic)
  expose(:topic)  { Topic.includes(answers: [:author]).find(params[:id]) }
  expose(:topics) { Topic.includes(:answers).order(created_at: :desc) }
  expose(:answer) { Answer.new }

  def show
    topic.counter += 1
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:info] = 'Topic created!'
      redirect_to topic_path(@topic)
    else
      render 'new'
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :content)
  end
end
