# frozen_string_literal: true

class RenameHyperlink < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      alter table speaking_engagements add column video_hyperlink varchar;
      update speaking_engagements set video_hyperlink = hyperlink;
      alter table speaking_engagements drop column hyperlink;
    SQL
  end

  def down
    raise ActiveRecord::IrrevisbleMigration
  end
end
