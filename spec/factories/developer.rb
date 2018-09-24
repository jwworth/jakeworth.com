# frozen_string_literal: true

FactoryBot.define do
  factory :developer do
    password { FFaker::InternetSE.password }
    email { FFaker::InternetSE.email }
  end
end
