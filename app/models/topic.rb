class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy   
  
  scope :visible_to, -> (user) { user ? all : publicly }
  
  validates :name, length: {minimum: 5 }, presence: true 
  
  def self.publicly
    where(public: true)
  end
  
  def self.privately
    where(public: false)
  end
    
end
