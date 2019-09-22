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
            render 'static_pages/home'
        end
    end
  
    def show
        @micropost = current_user.microposts.find(params[:id]) 
        send_data(@micropost.imagedb,
        :filename => @micropost.filename,
        :type => @micropost.content_type,
        :disposition => "inline")
        end

    def destroy
    end

    private

    def micropost_params
      params.require(:micropost).permit(:content, :title, :imagedb)
    end

  end