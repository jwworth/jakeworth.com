# frozen_string_literal: true

namespace :db do
  dump_file = 'tmp/latest.dump'

  file dump_file do
    system 'heroku pg:backups capture --app jakeworth-com'
    system "curl -o #{dump_file} `heroku pg:backups public-url -a jakeworth-com`"
  end

  # This task requires the heroku toolbelt and access to production
  desc 'Download and restore prod db; requires heroku toolbelt and production db access'
  task restore_production_dump: dump_file do
    puts 'Restoring latest production data'
    system "pg_restore --verbose --clean --no-acl --no-owner #{dump_file} | rails dbconsole"
    puts 'Completed successfully!'
  end
end
