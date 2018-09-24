# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Developer, type: :model do
  it 'should have a valid factory' do
    developer = FactoryBot.create(:developer)

    expect(developer).to be_valid
  end
end
