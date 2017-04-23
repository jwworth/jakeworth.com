module PostHelper

  EMOJIS = %w(
    &#127832;
    &#127833;
    &#127834;
    &#127836;
    &#127843;
    &#127845;
    &#127857;
  ).freeze

  def emoji_of_the_day
    CGI.unescapeHTML(EMOJIS[Date.today.wday])
  end
end
