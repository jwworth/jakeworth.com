unless Developer.find_by_email('jake@example.com')
  Developer.create!(email: 'jake@example.com', password: 'password')
  puts 'Created Jake'
end

technologies = %w(assembly bash clojure data ember)

10.times do
  theme = technologies.sample
  post = Post.create!(title: "A post about #{theme}", body: (theme + ' ') * 200)
  puts "Created post ##{post.id}"
end
