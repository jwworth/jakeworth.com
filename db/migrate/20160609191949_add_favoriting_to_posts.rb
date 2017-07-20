# frozen_string_literal: true

class AddFavoritingToPosts < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      alter table posts add column favorite boolean default false not null;
    SQL
  end

  def down
    execute <<-SQL
      alter table posts drop column favorite;
    SQL
  end
end
