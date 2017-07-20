# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :hyperlink, null: false

      t.timestamps null: false
    end
  end
end
