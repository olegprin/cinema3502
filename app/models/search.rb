class Search < ActiveRecord::Base
  

  #def initialize(attributes)
    #@search = attributes[:search] || ""
 # end

  def result
   # @result ||= Page.fulltext_search(self.search, { :return_scores => true })
  end
  
end
