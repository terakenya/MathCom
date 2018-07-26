class ArticlesController < ApplicationController
  def index
    @questions = Question.all
  end
end
