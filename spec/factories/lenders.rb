FactoryGirl.define do
  factory :lender do
    name        { Faker::Company.name         }
    description { Faker::Company.catch_phrase }

    factory :lender_with_products do
      transient do
        products_count 5
      end

      after(:create) do |lender, evaluator|
        create_list(:product, evaluator.products_count, lender: lender)
      end
    end
  end
end
