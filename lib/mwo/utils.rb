module MWO::Utils
  def fetch(url)
    response = open(url)
    body = JSON.parse(response.read)
  end

end
