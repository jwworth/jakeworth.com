class ContentStandardizer

  def self.replace_subheaders(content)
    content.gsub(/^###(\s\w*)/, '####\1')
  end
end
