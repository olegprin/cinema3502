class HomeController < ApplicationController

  def index

  end
    
  def all_film
    @films = Film.search(params[:search]).paginate(:page => params[:page], :per_page => Configurable[:films_per_page])
    @resourse='Film'
  end	

end
