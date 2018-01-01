# frozen_string_literal: true

module PostHelper
  EMOJIS = [
    ['Lake',     '&#x2631;'],
    ['Fire',     '&#x2632;'],
    ['Thunder',  '&#x2633;'],
    ['Wind',     '&#x2634;'],
    ['Water',    '&#x2635;'],
    ['Mountain', '&#x2636;'],
    ['Earth',    '&#x2637;'],
    ['Heaven',   '&#x2630;']
  ].freeze

  def emoji_of_the_day
    emoji = EMOJIS[Date.today.wday]
    content_tag(:span, CGI.unescapeHTML(emoji[1]), title: emoji[0], class: 'favorite')
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
end
