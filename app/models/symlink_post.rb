# frozen_string_literal: true

class SymlinkPost < ApplicationRecord
  validates :link_url, presence: true
  validates :title, presence: true
  validates :favorite, presence: true
end
