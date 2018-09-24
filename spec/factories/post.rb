# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    sequence :title do |i|
      "A post about everything #{i}"
    end

    body 'Lots of content here'
  end
end
