# frozen_string_literal: true

require 'rails_helper'
require './lib/content_standardizer'

RSpec.describe ContentStandardizer do
  specify '.replace_subheaders' do
    output = ContentStandardizer.replace_subheaders("### Legacy Subhead\n#### Unaffected")
    standardized = "#### Legacy Subhead\n#### Unaffected"

    expect(output).to eq(standardized)
  end
end
