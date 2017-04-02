FactoryGirl.define do
  factory :school do
    external_id { Faker::Number.between(100_000, 999_000)   }
    name        { "#{Faker::Name.name_with_middle} College" }
    address     { Faker::Address.street_address             }
    city        { Faker::Address.city                       }
    state       { Faker::Address.state_abbr                 }
    zip         { Faker::Address.zip                        }
  end
end
