# frozen_string_literal: true

module PostHelper
  EMOJIS = {
    lake:     '&#x2631;',
    fire:     '&#x2632;',
    thunder:  '&#x2633;',
    wind:     '&#x2634;',
    water:    '&#x2635;',
    mountain: '&#x2636;',
    earth:    '&#x2637;',
    heaven:   '&#x2630;'
  }.freeze

  def emoji_of_the_day
    CGI.unescapeHTML(EMOJIS.values[Date.today.wday])
  end

  def preceding_post(post)
    post_ids = Post.ordered.pluck(:id)
    post_index = post_ids.index(post.id)
    Post.find_by_id(post_ids[post_index + 1])
  end

  def succeeding_post(post)
    post_ids = Post.ordered.pluck(:id)
    post_index = post_ids.index(post.id)
    Post.find_by_id(post_ids[post_index - 1]) unless post_index.zero?
  end

  def display_date(post)
    post.created_at.strftime('%b %-e, %Y')
  end
end
