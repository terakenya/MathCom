class ArticlesController < ApplicationController
  def index
    if (!params[:generation])
      @questions = Question.all.page(params[:page]).per(3)
    else
      @questions = Question.where(generation: params[:generation]).page(params[:page]).per(3)
    end
  end

  def new

  end

  def search
    @questions = Question.where('title LIKE(?) or description LIKE(?)', "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    respond_to do |format|
      format.json
    end
  end

end
