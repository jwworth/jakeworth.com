# frozen_string_literal: true

desc 'Deploy the site'
task :deploy do
  env = ENV['ENV']
  raise 'Unsupported environment' unless %w[staging production].include?(env)
  puts "Deploying to #{env}..."

  system "git tag -d #{env}"
  system "git push origin :refs/tags/#{env}"
  system "git tag #{env}"
  system 'git push origin --tags'

  system "git push #{env} master"
  system 'heroku run rake db:migrate'
  system "heroku restart -r#{env}"
  system "heroku open -r#{env}"

  print 'Done.'
end
