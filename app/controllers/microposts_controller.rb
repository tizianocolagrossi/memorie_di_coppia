class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
  
    def new
        @micropost = current_user.microposts.build if logged_in?
    end
    

    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to root_url
        else
            redirect_to root_url
        end
    end
  
    def destroy
    end

    private

    def micropost_params
      params.require(:micropost).permit(:content, :title, :image)
    end

  end