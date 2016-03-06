  class Postings::CommentsController < CommentsController
  before_action :set_posting



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posting
      @commentable = Posting.find(params[:posting_id])
    end

  
end
