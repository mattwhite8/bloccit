class FavoritesController < ApplicationController
  
  def create 
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    
    if favorite.save
      flash[:notice] = "You favorited this!" 
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was a problem, try again."
      redirect_to [@post.topic, @post]
    end
  end
  
  def destroy 
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.where(post_id: @post.id).first
    
    if favorite.destroy
      flash[:notice] = "You unfavorited this!"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was a problem, try again."
      redirect_to [@post.topic, @post]
    end
  end
  
  
  
end
