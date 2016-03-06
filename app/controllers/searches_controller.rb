class SearchesController < ApplicationController
	
  respond_to :html, :js, :json

  def new
    @search = Search.new
    @categories=Film.uniq.pluck(:category)
    respond_modal_with  @search 
  end

  def search_film
    @search_title=params[:search][:title]
    @search_year=params[:search][:year]
    @search_language=params[:search][:language]
    @search_actor=params[:search][:actor]
    @search_subtitle=params[:search][:subtitle]
    @search_category=params[:search][:category]
    render "show"
  end
 
  private

    # Use callbacks to share common setup or constraints between actions.
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:title, :year, :actor, :language, :subtitle)
    end

end
