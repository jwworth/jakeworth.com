# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    body { 'Lots of content here' }
    sequence :title do |i|
      "A post about everything #{i}"
    end
  end
end
