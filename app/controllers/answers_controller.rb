class AnswersController < ApplicationController
  expose(:answer) { current_user.answers.build(answer_params) }

  def create
    if answer.save
      flash[:info] = "success"
    else
      flash[:warning] = "failure"
    end
      redirect_to :back
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :topic_id)
  end
end
