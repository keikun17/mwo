module MWO::Utils
  def fetch(url)
    response = open(url)
    body = JSON.parse(response.read)
  end

  def to_symbol(string)
    word = string.dup
    word.gsub!(/::/, '/')
    word.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
    word.tr!('-', '_')
    word.downcase!
    word.to_sym
  end

end

