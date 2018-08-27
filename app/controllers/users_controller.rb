class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(current_user)
  end
end
