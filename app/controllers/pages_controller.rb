class PagesController < ApplicationController
  def home
    if logged_in?
      redirect_to user_path(current_user.id)
    end
  end
end
