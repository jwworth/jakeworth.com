module MarkdownHelper
  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                          autolink: true,
                                          tables: true,
                                          no_intra_emphasis: true,
                                          fenced_code_blocks: true,
                                          strikethrough: true,
                                          space_after_headers: true,
                                          underline: true,
                                          highlight: true)
  end

  def markdown_render(md)
    raw markdown.render md
  end
end
