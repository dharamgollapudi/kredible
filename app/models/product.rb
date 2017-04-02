class Product < ActiveRecord::Base
  belongs_to :lender

  def eligible?(submission)
    eligible_by_income?(submission) &&
    eligible_by_credit_score?(submission) &&
    eligible_by_school?(submission)
  end

  def eligible_by_income?(submission)
    submission.income >= self.min_income
  end 

  def eligible_by_credit_score?(submission)
    submission.credit_score >= self.min_credit_score
  end 

  def eligible_by_school?(submission)
    self.lender.schools.include? submission.school
  end 
end
