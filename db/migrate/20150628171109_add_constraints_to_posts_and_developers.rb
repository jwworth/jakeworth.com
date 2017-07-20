# frozen_string_literal: true

class AddConstraintsToPostsAndDevelopers < ActiveRecord::Migration
  def change
    change_column_null :developers, :created_at, false
    change_column_null :developers, :updated_at, false
    change_column_null :posts, :created_at, false
    change_column_null :posts, :updated_at, false
    change_column_null :posts, :title, false
    change_column_null :posts, :body, false
  end
end
