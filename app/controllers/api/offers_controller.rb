class Api::OffersController < ApplicationApiController
  def index
    @offers = submission.offers
  end

protected
  def submission
    Submission.find(params[:submission_id])
  end
end
