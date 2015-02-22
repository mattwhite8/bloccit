class PostsController < ApplicationController
  def index
    p current_user
    @posts = PostPolicy::Scope.new(current_user, Post).resolve
    authorize @posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post
  end
  
  def create
    #{"utf8"=>"✓", "authenticity_token"=>"J5Wb1DNQdsfKTuBNpwSuH+OxGbNoD/6LnH+TwO22p5M=", "post"=>{"title"=>"Hello", "body"=>"How are you "}, "commit"=>"Save"} 
    # "post"=>{"title"=>"Hello", "body"=>"How are you", password: "foobar"}
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post 
  end
  
    def update
     @post = Post.find(params[:id])
      authorize @post 
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
  
  
end
