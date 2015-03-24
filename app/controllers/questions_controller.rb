class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Successfully Updated!"
      redirect_to questions_path
    else
      render:edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "Question Removed"
      redirect_to questions_path
    else
      flash[:alert] = "Horrible failure"
    redirect_to question_path(@question)
    end
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
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
