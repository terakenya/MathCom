class ArticlesController < ApplicationController
  # def index
  #   if (!params[:keywordSearch])
  #     if (!params[:generation])
  #       @questions = Question.all.page(params[:page]).per(2)
  #     else
  #       @questions = Question.where(generation: params[:generation]).page(params[:page]).per(2)
  #     end
  #   else
  #     @questions = Question.where('title LIKE(?) or description LIKE(?)', "%#{params[:keywordSearch]}%",
  #      "%#{params[:keywordSearch]}%").page(params[:page]).per(2)
  #   end
  # end

  # def new
  #   @question = Question.new
  # end

  # def create
  #   @question = Question.new(question_params)
  #   @question.save
  #   redirect_to (@question)
  # end

  # def show
  # end

  def search
    @questions = Question.where('title LIKE(?) or description LIKE(?)', "%#{params[:keyword]}%", "%#{params[:keyword]}%").limit(1)
    respond_to do |format|
      format.json
    end
  end

 def index
  end

  def new
    @article = Article.new
  end

  def create
    if @article = Article.create(article_params)
      redirect_to action: :show, id: @article.id
    else
      redirect_to action: :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def stocks
    @stocks = Stock.where(user_id: current_user.id, is_stocked: 1)
  end

  def stocks_search
    query = params[:q].values
    @query = query[0]
    @q = Article.ransack(params[:q])
    @articles = @q.result
  end

  def search
    query = params[:q].values
    @query = query[0]
    @q = Article.ransack(params[:q])
    @articles = @q.result
  end

  private
  def article_params
    params.require(:article).permit(
      :user_id,
      :title,
      :body,
      :likes_count
    ).merge(tag_list: params[:article][:tag])
  end

  def move_to_session
    redirect_to "/users/sign_in" unless user_signed_in?
  end




    # @stock = Stock.create(user_id: current_user.id, article_id: params[:article_id], is_stocked: 1)

  # private
  # def question_params
  #   params.require(:question).permit(:description, :title, :image, :image_cache, :remove_image)
  # end

end
