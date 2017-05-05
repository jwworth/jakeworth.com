class AddSlidesHyperlinkToSpeakingEngagements < ActiveRecord::Migration[5.0]
  def up
    execute 'alter table speaking_engagements add column slides_hyperlink varchar'
  end

  def down
    execute 'alter table speaking_engagements drop column slides_hyperlink'
  end
end
