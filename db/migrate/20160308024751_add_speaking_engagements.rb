class AddSpeakingEngagements < ActiveRecord::Migration
  def up
    execute <<-SQL
      create table speaking_engagements(
        title varchar not null,
        location varchar not null,
        date timestamptz not null,
        created_at timestamptz not null,
        updated_at timestamptz not null,
        hyperlink varchar
      );
    SQL
  end

  def down
    execute <<-SQL
      drop table speaking_engagements;
    SQL
  end
end
