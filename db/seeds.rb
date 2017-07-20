# frozen_string_literal: true

seed_file = Rails.root.join("db/seeds/#{Rails.env}.rb")
if seed_file.exist? && !ENV['NO_SEED_DATA']
  puts "*** Loading #{Rails.env} seed data"
  require seed_file
end

puts 'Creating projects'
Project.find_or_create_by(title: 'jakeworth.com') do |project|
  project.description = 'My development blog.'
  project.hyperlink = 'http://jakeworth.com'
  project.featured_order = 1
end

Project.find_or_create_by(title: 'CERAMIC NATION') do |project|
  project.description = 'A Markov Chain generated novel.'
  project.hyperlink = 'http://ceramic-nation.jakeworth.com'
  project.featured_order = 2
end

Project.find_or_create_by(title: 'Today I Learned') do |project|
  project.description = <<-DESC
    TIL is a project by Hashrocket to catalogue the sharing & accumulation of knowledge as it happens day-to-day. Posts have a 200-word limit and any Hashrocket team member can contribute. This was a project I built while pair-programming as an apprentice at Hashrocket.
    DESC
  project.hyperlink = 'http://til.hashrocket.com'
  project.featured_order = 3
end

Project.find_or_create_by(title: 'Capybara Driver Benchmarking') do |project|
  project.description = <<-DESC
    This is the test app I built for a talk at Hashrocket's Summer Miniconf 2015. Its purpose is to benchmark the performance of the drivers available for use with Capybara.
    DESC
  project.hyperlink = 'https://github.com/jwworth/cap-driver-benchmarking'
  project.featured_order = 4
end
puts '...complete'
