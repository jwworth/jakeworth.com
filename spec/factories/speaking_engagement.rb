# frozen_string_literal: true

FactoryBot.define do
  factory :speaking_engagement do
    date { Time.now }
    location { 'Chicago, IL' }
    title { 'Title so cool' }
  end
end
