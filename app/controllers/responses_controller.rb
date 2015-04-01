class ResponsesController < ApplicationController
  def new
    @response = Response.new
  end

  def destroy
    @question = Question.find(params[:question_id])
    @response = Response.find(params[:id])
    if @response.destroy
      flash[:notice] = "Response Removed"
      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end
    else
      flash[:alert] = "Something Went Horribly Wrong"
      redirect_to questions_path
    end
  end

  def create
    @question = Question.find(params[:question_id])
    @response = Response.new(response_params)
    @response.user_id = current_user.id
    @response.question_id = @question.id
    if @response.save
      flash[:notice] = "Thanks for answering!"
      respond_to do |format|
        format.html { redirect_to question_path(@question) }
        format.js
      end
    else
      flash[:alert] = "Something went Wrong!"
      redirect_to questions_path
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @response = Response.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @response = Response.find(params[:id])
    if @response.update(response_params)
      flash[:notice] = "Successfully Updated"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Something Went Wrong"
      redirect_to question_path(@question)
    end
  end


private
  def response_params
    params.require(:response)
      .permit(:content, :user_id, :question_id, :best?, :score)
  end
end
