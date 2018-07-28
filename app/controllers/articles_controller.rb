class ArticlesController < ApplicationController
  def index
    if (!params[:generation])
      @questions = Question.all.page(params[:page]).per(2)
    else
      @questions = Question.where(generation: params[:generation]).page(params[:page]).per(2)
    end
  end
end
