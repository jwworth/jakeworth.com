class DropSpeakingEngagements < ActiveRecord::Migration
  def up
    execute 'drop table speaking_engagements;'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
