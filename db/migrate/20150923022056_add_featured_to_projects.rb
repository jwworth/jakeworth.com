# frozen_string_literal: true

class AddFeaturedToProjects < ActiveRecord::Migration
  def up
    execute 'alter table projects add column featured boolean default false'
  end

  def down
    execute 'alter table projects drop column featured'
  end
end
