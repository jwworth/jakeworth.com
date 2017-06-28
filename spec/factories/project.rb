# frozen_string_literal: true

FactoryGirl.define do
  factory :project do
    title 'A cool project'
    description 'With cool features'
    hyperlink 'http://www.google.com'
    featured_order 1
  end
end
