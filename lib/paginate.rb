module Paginate
  def paginate(args = {})
  
    self.limit(10).offset(args[:page] * 10)
    
  end
end