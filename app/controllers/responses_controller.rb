class ResponsesController < ApplicationController
  def new
    @response = Response.new
  end

  def create
    @question = Question.find(params[:question_id])
    @response = Response.new(response_params)
    if @response.save
      flash[:notice] = "Thanks for answering!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Something went Wrong!"
      redirect_to question_path(@question)
    end
  end

private
  def response_params
    params.require(:response)
      .permit(:content, :user_id, :question_id, :best?, :score)
  end
end
