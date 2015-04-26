unless Developer.find_by_email('jake@example.com')
  Developer.create!(email: 'jake@example.com', password: 'password')
  puts 'Created Jake'
end
