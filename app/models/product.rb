class Product < ActiveRecord::Base
  belongs_to :lender

  def eligible?(submission)
    submission.income >= self.min_income &&
    submission.credit_score >= self.min_credit_score
  end

  def eligible_by_income?(submission)
    submission.income >= self.min_income
  end  
end
