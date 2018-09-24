# frozen_string_literal: true

FactoryBot.define do
  factory :developer do
    email { FFaker::InternetSE.email }
    password { FFaker::InternetSE.password }
  end
end
