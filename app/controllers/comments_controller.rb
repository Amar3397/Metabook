class CommentsController < ApplicationController
  def index
    @comments= Comment.all
  end
  def new
    @post=Post.find(params[:post_id])
    @comment= Comment.new
    @comment.post= @post
  end
 
  def show
    @comment= comment.find(params[:id])
  end 

  def create
    
    @post=Post.find(params[:post_id])
    @comment=current_user.comments.new(comment_params)
    @comment.post= @post  
    if @comment.save

      redirect_to post_path(@post)
    else
      render :new
    end
  end
  
  def destroy
    @post= Post.find(params[:post_id])
    @comment= @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body, :commenter)
    end

end
