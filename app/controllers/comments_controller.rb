class CommentsController < ApplicationController
  
  def create  
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.create(comment_params_with_post)
       
    authorize @comment 
    
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@post.topic, @post]
    end
    
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was deleted."
    else 
      flash[:error] = "Comment couldn't be deleted.  Try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
    
  end
      
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
  def comment_params_with_post
    comment_params.merge(post: @post)
  end
  
end
