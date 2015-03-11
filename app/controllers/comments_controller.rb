class CommentsController < ApplicationController
  
  def create 
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.create(comment_params_with_post)
    @new_comment = Comment.new
    
    authorize @comment 
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [@topic, @post]
    end
    
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    
    authorize @comment
    if @comment.destroy
      flash[:noice] = "Comment was deleted."
      redirect_to [@topic, @post]
    else 
      flash[:error] = "Comment couldn't be deleted.  Try again."
      redirect_to [@topic, @post]
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
