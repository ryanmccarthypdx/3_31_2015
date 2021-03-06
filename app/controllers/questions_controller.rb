class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Successfully Updated!"
      respond_to do |format|
        format.html { redirect_to questions_path }
        format.js
      end
    else
      render:edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "Question Removed"
      respond_to do |format|
        format.html { redirect_to questions_path }
        format.js
      end
    else
      flash[:alert] = "Horrible failure"
      redirect_to questions_path
    end
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @response = Response.new
    @responses = @question.responses
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      flash[:notice] = "Question submitted!"
      respond_to do |format|
        format.html { redirect_to questions_path }
        format.js
      end
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
