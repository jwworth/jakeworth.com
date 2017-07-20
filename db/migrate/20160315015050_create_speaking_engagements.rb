# frozen_string_literal: true

class CreateSpeakingEngagements < ActiveRecord::Migration
  def change
    create_table :speaking_engagements do |t|
      t.string :title, null: false
      t.string :location, null: false
      t.timestamp :date, null: false
      t.string :hyperlink

      t.timestamps null: false
    end
  end
end
