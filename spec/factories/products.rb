FactoryGirl.define do
  factory :product do
    lender

    term             { Faker::Number.between(12, 120)            }
    apr              { Faker::Number.between(3.0, 12.0).round(2) }
    min_credit_score { Faker::Number.between(630, 750)           }
    min_income       { Faker::Number.between(25_000, 60_000)     }
  end
end
