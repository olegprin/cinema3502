module SearchesHelper

  def search_film
    @films=Film.all
    @films=@films.where(["title LIKE ?","%#{@search_title}%"]) if @search_title.present?
    @films=@films.where(["title LIKE ?","%#{@search_year}%"]) if @search_year.present?
    @films=@films.where(["title LIKE ?","%#{@search_language}%"]) if @search_language.present?
    @films=@films.where(["title LIKE ?","%#{@search_actor}%"]) if @search_actor.present?
    @films=@films.where(["title LIKE ?","%#{@search_subtitle}%"]) if @search_subtitle.present?
    @films=@films.where(["title LIKE ?","%#{@search_category}%"]) if @search_category.present?
    return @films
  end 

end
