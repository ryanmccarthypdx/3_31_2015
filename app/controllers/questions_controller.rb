class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      flash[:notice] = "Question submitted!"
      redirect_to questions_path
    else
      flash[:alert] = "Something went wrong!"
      render :new
    end
  end

  private
    def question_params
      params.require(:question)
            .permit(:title, :body, :user_id)
    end
end
