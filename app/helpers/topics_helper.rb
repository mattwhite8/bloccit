module TopicsHelper
  
  def will_paginate(collection)
    result = "<ul class='paginate'>"
    1.upto(collection.count/10) do |i|
      result << "<li><a href='#'> #{i} </a></li>"
    end
    result << "</ul>"
  end
  
end
