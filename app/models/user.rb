class User

  def import
    uri = "https://jsonplaceholder.typicode.com/users" # api externe

    content = callApi(uri)  # on va récupérer le json

    user = JSON.parse(content) # on va parser pour récuprer la data

    user.first()["name"] # on récupère le premier user dans le json
  end

  private

  def callApi(uri)

    Net::HTTP.get(URI.parse(uri))

  end
end
