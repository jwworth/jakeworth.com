class CreateSymlinkPosts < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      create table symlink_posts (
        link_url varchar not null,
        title varchar not null,
        favorite boolean not null default false,
        created_at timestamptz not null default now(),
        updated_at timestamptz not null default now()
      )
    SQL
  end

  def down
    execute 'drop table symlink_posts;'
  end
end
