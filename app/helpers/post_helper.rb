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
end
