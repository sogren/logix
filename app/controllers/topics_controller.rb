class TopicsController < ApplicationController
  before_filter(only: [:new, :create]) { require_login(topics_path) }
  expose(:topics) { Topic.order(created_at: :desc) }
  expose(:answer) { Answer.new }

  def index
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.find(params[:id])
    @topic.update(counter: @topic.counter + 1)
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
#class TopicsController < ApplicationController
#  before_filter(only: [:new, :create]) { require_login(topics_path) }
#  expose(:topics) { Topic.order(created_at: :desc) }
#  expose(:topic)
#  expose(:answer) { Answer.new }
#
#  def index
#  end
#
#  def show
#    topic.update(counter: topic.counter + 1)
#  end
#
#  def create
#    topic = Topic.new(topic_params)
#    topic = current_user.topics.build(topic_params)
#    if topic.save
#      flash[:info] = 'Topic created!'
#      redirect_to topic
#    else
#      flash[:danger] = 'Topic creation failed!'
#      render 'new'
#    end
#  end
#
#  private
#
#  def topic_params
#    params.require(:topic).permit(:title, :content)
#  end
#end
#