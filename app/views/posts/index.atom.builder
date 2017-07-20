# frozen_string_literal: true

atom_feed do |feed|
  feed.title ENV['site_name']
  feed.updated @posts.last.created_at

  @posts.each do |post|
    feed.entry post do |entry|
      entry.title post.title
      entry.content(markdown_render(post.body), type: 'html')
      entry.author do |author|
        author.name 'jake worth'
      end
    end
  end
end
