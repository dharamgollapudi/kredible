require 'rails_helper'

RSpec.describe Lender, type: :model do
  it { should have_and_belong_to_many(:schools) }

end
