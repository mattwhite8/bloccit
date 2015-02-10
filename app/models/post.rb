class Post < ActiveRecord::Base
  has_many :comments
  
  def self.hello
    p "hello world"
  end
  
  def announce
    p "hello world"
  end
  
end
