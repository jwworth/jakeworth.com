# frozen_string_literal: true

FactoryBot.define do
  factory :speaking_engagement do
    title 'Title so cool'
    date Time.now
    location 'Chicago, IL'
  end
end
