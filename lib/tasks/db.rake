# This task requires the heroku toolbelt and access to production
namespace :db do
  dump_file = 'tmp/latest.dump'

  file dump_file do
    system "heroku pg:backups capture --app jakeworth-com"
    system "curl -o #{dump_file} `heroku pg:backups public-url -a jakeworth-com`"
  end

  desc 'Download and restore prod db; requires heroku toolbelt and production db access'
  task restore_production_dump: dump_file do
    puts 'Restoring latest production data'
    system "pg_restore --verbose --clean --no-acl --no-owner #{dump_file} | rails dbconsole"
    puts 'Completed successfully!'
  end

  desc 'Seed initial speaking engagements'
  task seed_speaking_engagements: :environment do
    print 'Seeding speaking engagements...'
      SpeakingEngagement.transaction do
        [['Dive into Vim Language Plugins', 'Vim Chicago Meetup', '2016-04-07 21:22:16 -0600'],
        ['Searching Vim Plugins', 'Vim Chicago Meetup', '2016-03-14 20:53:22 -0500'],
        ['Military to Programmer', 'Code Platoon (Alpha)', '2016-02-17 21:22:16 -0600'],
        ['Test Driven Development/Pair Programming Workshop', 'Code Platoon (Alpha)', '2016-02-17 21:22:16 -0600', 'https://vimeo.com/155702597'],
        ['Introduction to Vim', 'Vim Chicago Meetup', '2015-11-07 21:22:16 -0600'],
        ['Ceramic Nation Lightning Talk', 'Hashrocket Winter Miniconf 2015', '2015-12-07 21:22:16 -0600'],
        ['Capybara Driver Benchmarking', 'Hashrocket Summer Miniconf', '2015-06-07 21:22:16 -0600']].each do |array|
          SpeakingEngagement.find_or_create_by!(title: array[0]) do |engagement|
            engagement.location = array[1]
            engagement.date = array[2]
            engagement.hyperlink = array[3]
          end
        end
      end
    puts ' done.'
  end
end
