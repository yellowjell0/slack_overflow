class QuestionsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :create, :destroy]
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
     @question = Question.new(question_params)

    if @question.save
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "Succesfully deleted"
      redirect_to questions_path
    else
      flash[:alert] = "Error deleting Question"
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
