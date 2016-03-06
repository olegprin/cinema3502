class Post < ActiveRecord::Base
  has_many :questions
  accepts_nested_attributes_for
  accepts_nested_attributes_for :questions, allow_destroy: true

  def xer
     where(id: 7)
  end  
end
