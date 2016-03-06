class StoreController < ApplicationController
  
  include CurrentCart
  before_action :set_cart
  respond_to :html, :json

  def all_category
  	@products = Product.order(:title)
  end

  def index
    @messagestoadministrator = Messagestoadministrator.new
    @product=Product.first
  	@products = Product.order(:title)
    @resourse='Product'
  end

  def show
    respond_modal_with @cart
  end 

  def showlike
    respond_modal_with @cart
  end
  

  def contact
    @messagestoadministrator = Messagestoadministrator.new
  end 
   
end
