require 'rails_helper'

describe User do
  
  include TestFactories
  
  
  
  describe "#favorited(post)" do
    
    before do 
      @post = associated_post
      @user = authenticated_user      
    end
    
    it "returns 'nil' if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to be_nil
    end
    
    it "returns the appropriate favorite if it exists" do
      @user.favorites.create(post: @post)
      expect( @user.favorited(@post) ).not_to be_nil
    end
    
    it "returns `nil` if the user has favorited another post" do
      @user.favorites.create(post: @post)
      post = Post.new(title: "Placeholder", body: "This is placeholder body text for this post.")
      post.save
      
      expect( @user.favorited(post) ).to be_nil      
    end
    
  end
end
