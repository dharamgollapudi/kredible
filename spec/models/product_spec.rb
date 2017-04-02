require 'rails_helper'

RSpec.describe Product, type: :model do
	before :each do 
		@lender = FactoryGirl.create(:lender)
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
			it 'should return true' do
				@product = FactoryGirl.create(:product, lender: @lender, min_income: 100_000)
				@submission = FactoryGirl.create(:submission, income: 90_000)

				expect(@product.eligible_by_income?(@submission)).to be_falsey
			end
		end		
	end	
end
