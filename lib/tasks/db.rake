# This task requires the heroku toolbelt and access to production

require './lib/content_standardizer'

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

  desc 'Standardizes markdown content'
  task standardize_markdown_content: :environment do
    puts 'Replacing h3s with h4'
    Post.all.each do |post|
      if post.body.match(/^###(\s\w*)/)
        puts "Updating post #{post.id}"
        post.update_attribute(:body, ContentStandardizer.replace_subheaders(post.body))
      end
    end
    puts 'Done.'
  end
end
