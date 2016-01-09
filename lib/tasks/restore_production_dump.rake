# This task requires the heroku toolbelt and access to production
namespace :db do
  task :restore_production_dump do
    puts 'Restoring latest production data'
    system 'heroku pg:backups capture --app jakeworth-com'
    system 'curl -o latest.dump `heroku pg:backups public-url -a jakeworth-com`'
    system 'pg_restore --verbose --clean --no-acl --no-owner -h localhost -d worth-chicago_co_development latest.dump'
    system 'rm latest.dump'
    puts 'Completed successfully!'
  end
end
