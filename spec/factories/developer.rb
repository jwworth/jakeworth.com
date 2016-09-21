FactoryGirl.define do
  factory :developer do
    password { FFaker::InternetSE.password }
    email { FFaker::InternetSE.email }
  end
end
