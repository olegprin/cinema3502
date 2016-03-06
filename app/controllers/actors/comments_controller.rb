  class Actors::CommentsController < CommentsController
  before_action :set_actor



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @commentable = Actor.find(params[:actor_id])
    end

  
end
