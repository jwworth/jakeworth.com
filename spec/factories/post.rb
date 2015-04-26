FactoryGirl.define do
  factory :post do
    sequence :title do |i|
      "A post about everything #{i}"
    end

    body 'Lots of content here'
  end
end
