module MWO::CollectionUtils
  def filter(options = {})
    filtered = self.find_all do |element|
      matches = options.find_all do |k,v|
        element.send(k) == options[k]
      end
      !matches.empty?
    end

    filtered
  end
end
