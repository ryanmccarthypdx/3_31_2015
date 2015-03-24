class ResponsesController < ApplicationController
  def new
    @response = Response.new
  end

  def destroy
    @question = Question.find(params[:question_id])
    @response = Response.find(params[:id])
    if @response.destroy
      flash[:notice] = "Response Removed"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Something Went Wrong"
      redirect_to question_path(@question)
    end
  end

  def create
    @question = Question.find(params[:question_id])
    @response = Response.new(response_params)
    @response.user_id = current_user.id
    @response.question_id = @question.id
    if @response.save
      flash[:notice] = "Thanks for answering!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Something went Wrong!"
      redirect_to question_path(@question)
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @response = Response.find(params[:id])
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
