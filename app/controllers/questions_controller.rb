class QuestionsController < ApplicationController
  def index
    if (!params[:keywordSearch])
      if (!params[:generation])
        @questions = Question.all.page(params[:page]).per(5)
      else
        @questions = Question.where(generation: params[:generation]).page(params[:page]).per(5)
      end
    else
      @questions = Question.where('title LIKE(?) or description LIKE(?)', "%#{params[:keywordSearch]}%",
       "%#{params[:keywordSearch]}%").page(params[:page]).per(2)
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to (@question)
  end

  def show
  end

  def search
    @questions = Question.where('title LIKE(?) or description LIKE(?)', "%#{params[:keyword]}%", "%#{params[:keyword]}%").limit(3)
    respond_to do |format|
      format.json
    end
  end

  private
  def question_params
    params.require(:question).permit(:description, :title, :generation, :image, :image_cache, :remove_image)
  end
end
