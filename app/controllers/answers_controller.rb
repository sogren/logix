class AnswersController < ApplicationController
  expose(:answer) { current_user.answers.build(answer_params) }

  def create
    if answer.save
      flash[:info] = "success"
      redirect_to :back
    else
      flash[:warning] = "failure"
      redirect_to :back
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :topic_id)
  end
end
