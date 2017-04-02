class Product < ActiveRecord::Base
  belongs_to :lender

  def eligible?(submission)
    submission.income >= self.min_income &&
    submission.credit_score >= self.min_credit_score
  end
end
