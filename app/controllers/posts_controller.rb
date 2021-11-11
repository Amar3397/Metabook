class PostsController < ApplicationController
 before_action :set_post, only: %i[ destroy ]
  load_and_authorize_resource
  before_action :authenticate_user!,except: [:index]

  def index
    @posts= Post.all
  end
  
  def show
    @post= Post.find(params[:id])
  end

  def new
    @post= Post.new
  end

  def create
    @post= current_user.posts.new(post_params)
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
  end

  def edit
    @post= Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    if
      @post.update(post_params)
      redirect_to posts_path
    else
      render:edit
       
     end 
  end 
      
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  private 
  def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:post_description, :image, :user_id)
    end

end
