# frozen_string_literal: true

FactoryGirl.define do
  factory :developer do
    password { FFaker::InternetSE.password }
    email { FFaker::InternetSE.email }
  end
end
