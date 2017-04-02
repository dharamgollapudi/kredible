class Api::SubmissionsController < ApplicationApiController
  def create
    Submission.transaction do
      @submission = Submission.create!(create_params)
      @submission.calculate_products!
    end

    @submission
  end

  def show
    @submission = Submission.find(params[:id])
  end

protected
  def create_params
    params.permit(
      :name,
      :phone,
      :address,
      :ssn,
      :income,
      :credit_score,
      :amount
    )
  end
end
