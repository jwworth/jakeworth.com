# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    description { 'With cool features' }
    featured_order { 1 }
    hyperlink { 'http://www.google.com' }
    title { 'A cool project' }
  end
end
