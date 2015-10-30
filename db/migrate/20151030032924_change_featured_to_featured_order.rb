class ChangeFeaturedToFeaturedOrder < ActiveRecord::Migration
  def up
    execute <<-SQL
      alter table projects drop column featured;
      alter table projects add column featured_order integer;
    SQL
  end

  def down
    execute <<-SQL
      alter table projects add column featured boolean default false not null;
      alter table projects drop column featured_order;
    SQL
  end
end
