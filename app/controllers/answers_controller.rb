class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      flash[:notice] = "success"
      redirect_to :back
    else
      flash[:notice] = "failure"
      redirect_to :back
    end
  end

  def edit
  end

  def update
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :topic_id)
  end
end
