FactoryGirl.define do
  factory :offer do
    submission
    product

    apr  { product.apr }
    term { product.term }
  end
end
