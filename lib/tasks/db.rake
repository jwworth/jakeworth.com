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

  desc 'Delete cross-posted content, which hurts SEO'
  task delete_x_post: :environment do
    print 'Deleting cross-posted content...'
    x_post_titles = [
      '10 Vim Commands for a Better Workflow',
      'Introducing Today I Learned',
      'Reviewing Code',
      'Introducing Metabot',
      'Vim Magic with Abolish.vim',
      'Open-Sourcing Today I Learned'
    ]

    x_post_titles.each do |title|
      if x_post = Post.find_by(title: title)
        puts "Deleting post: #{x_post.title}"
        x_post.destroy
      end
    end

    puts ' done.'
  end
end
