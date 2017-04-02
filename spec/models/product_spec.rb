require 'rails_helper'

RSpec.describe Product, type: :model do
	before :each do 
		@school1 = FactoryGirl.create(:school)
		@school2 = FactoryGirl.create(:school)
		@lender = FactoryGirl.create(:lender, schools: [@school1])
	end

	describe '#eligible?' do
		context 'when the submission eligible_by_income? && eligible_by_credit_score?' do
			it 'should return true' do
				@product = FactoryGirl.create(:product, lender: @lender, min_income: 100_000, min_credit_score: 800)
				@submission = FactoryGirl.create(:submission, income: 100_000, credit_score: 800)

				expect(@product.eligible?(@submission)).to be_truthy	
			end	
		end	

		context 'when the submission is not eligible_by_income? || is not eligible_by_credit_score?' do
			it 'should return false' do
				@product = FactoryGirl.create(:product, lender: @lender, min_income: 100_000, min_credit_score: 800)
				@submission = FactoryGirl.create(:submission, income: 90_000, credit_score: 799)

				expect(@product.eligible?(@submission)).to be_falsey	
			end	
		end	
	end	

	describe '#eligible_by_income?' do
		context 'when submission income is >= product min income' do
			it 'should return true' do
				@product = FactoryGirl.create(:product, lender: @lender, min_income: 100_000)
				@submission = FactoryGirl.create(:submission, income: 100_000)

				expect(@product.eligible_by_income?(@submission)).to be_truthy
			end
		end	

		context 'when submission income is < product min income' do
			it 'should return false' do
				@product = FactoryGirl.create(:product, lender: @lender, min_income: 100_000)
				@submission = FactoryGirl.create(:submission, income: 90_000)

				expect(@product.eligible_by_income?(@submission)).to be_falsey
			end
		end		
	end	

	describe '#eligible_by_credit_score?' do
		context 'when submission credit score is >= product min credit score' do
			it 'should return true' do
				@product = FactoryGirl.create(:product, lender: @lender, min_credit_score: 800)
				@submission = FactoryGirl.create(:submission, credit_score: 800)

				expect(@product.eligible_by_credit_score?(@submission)).to be_truthy
			end
		end	

		context 'when submission credit score is < product min credit score' do
			it 'should return false' do
				@product = FactoryGirl.create(:product, lender: @lender, min_credit_score: 800)
				@submission = FactoryGirl.create(:submission, credit_score: 799)

				expect(@product.eligible_by_credit_score?(@submission)).to be_falsey
			end
		end		
	end

	describe '#eligible_by_school?' do
		context 'when submission school is one of lenders school' do
			it 'should return true' do
				@product = FactoryGirl.create(:product, lender: @lender, min_credit_score: 800)
				@submission = FactoryGirl.create(:submission, credit_score: 800, school: @school1)

				expect(@product.eligible_by_school?(@submission)).to be_truthy
			end
		end	

		context 'when submission school is not one of lenders school' do
			it 'should return false' do
				@product = FactoryGirl.create(:product, lender: @lender, min_credit_score: 800)
				@submission = FactoryGirl.create(:submission, credit_score: 799, school: @school2)

				expect(@product.eligible_by_school?(@submission)).to be_falsey
			end
		end		
	end	
end
