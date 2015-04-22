unless Developer.find_by_email('jake@example.com')
  puts 'Creating Jake'
  Developer.create!(email: 'jake@example.com', password: 'password')
end
