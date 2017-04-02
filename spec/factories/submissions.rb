FactoryGirl.define do
  factory :submission do
    name         { Faker::Name.name                       }
    phone        { Faker::PhoneNumber.cell_phone          }
    address      { Faker::Address.street_address          }
    ssn          { Faker::Number.number(10)               }
    income       { Faker::Number.between(20_000, 280_000) }
    credit_score { Faker::Number.between(600, 800)        }
    amount       { Faker::Number.between(5_000, 120_000)  }

    # will create one new lender and product per offer, but for the
    # purposes of this code challenge it is good enough
    factory :submission_with_offers do
      transient do
        offers_count 5
      end

      after(:create) do |submission, evaluator|
        create_list(:offer, evaluator.offers_count, submission: submission)
      end
    end
  end
end
