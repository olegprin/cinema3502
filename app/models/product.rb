class Product < ActiveRecord::Base
  
  include ObjectModel::Model
  

  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :description, presence: true, uniqueness: true, :length => {
    :minimum =>350}

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  @model_of_attachment='uploaded_file'.parameterize.underscore.to_sym	 
  include ValidationsForPicture
  
  if I18n.locale == :en 
    CATEGORY = %w[Mobile Laptop Other] 
  else I18n.locale == :ru 
    CATEGORY=%w[Модильный Ноутбук Другое]
  end    
   
  def self.latest
	  Product.order(:updated_at).last
  end

  def ensure_not_referenced_by_any_line_item
	  if line_items.empty?
	    return true
	  else
	    errors.add(:base, 'существуют товарные позиции')
	    return false
	  end
  end

end
