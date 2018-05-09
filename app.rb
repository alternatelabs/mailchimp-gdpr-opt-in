require "sinatra/base"

class App < Sinatra::Base
  get "/consent" do
    email = params["email"]
  end
end
