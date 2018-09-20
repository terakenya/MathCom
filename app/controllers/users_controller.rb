class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(prams[:user_id])
  end



  def show
    @user = User.find(params[:id])
    @id = @user.id
    @articles = Article.all
  end

  def like
    @user = User.find(params[:user_id])
    @id = @user.id
    @articles = Article.all
  end

  def private
    @user = User.find(params[:user_id])
    @id = @user.id
    @articles = Article.all
  end

  def commentpage
    @user = User.find(params[:user_id])
    @id = @user.id
    @articles = Article.all
  end

  def update
    @user = current_user
    judge = params[:judge]

    if judge == "0"
      @user.update(user_params)
      @tags = params[:tag]
      @tag = params[:this_tag]
    else
      @user.update(user_image_params)
      redirect_to action: :show
    end
  end

  private
  def user_params
    params.permit(
      :name,
      :email
    ).merge(tag_list: params[:tag])
  end

  def user_image_params
    params.permit(
      :name,
      :email
    ).merge(image: params[:user][:image])
  end

  def move_to_session
    redirect_to "/users/sign_in" unless user_signed_in?
  end

end
