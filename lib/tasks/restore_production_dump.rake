# This task requires the heroku toolbelt and access to production
namespace :db do
  task :restore_production_dump do
    def verify_exec(command)
      system(command)
      raise 'Command failed' unless $?.exitstatus.zero?
    end

    puts 'Restoring latest production data'
    verify_exec 'heroku pg:backups capture --app worth-chicago-co-production'
    verify_exec 'curl -o latest.dump `heroku pg:backups public-url -a worth-chicago-co-production`'
    verify_exec 'pg_restore --verbose --clean --no-acl --no-owner -h localhost -d worth-chicago_co_development latest.dump'
    verify_exec 'rm latest.dump'
    puts 'Completed successfully!'
  end
end
