# Default ENV to dev if not present
ENV["APP_ENV"] ||= "development"

# Autoload common standard library features and Gemfile gems
require "json"
require "digest"
require "bundler"
Bundler.require :default, ENV["APP_ENV"].to_sym

# Load dev environment variables
Dotenv.load if %w[development test].include? ENV["APP_ENV"]

class App < Sinatra::Base
  get "/consent" do
    email = params["email"]
    hexmail = Digest::MD5.hexdigest(email)
    list_id = ENV.fetch("MAILCHIMP_LIST_ID")
    api_key = ENV.fetch("MAILCHIMP_API_KEY")
    mc = Mailchimp::API.new(api_key)

    member_info = mc.lists.member_info(list_id, [hexmail])
    p member_info

    "Success"
  rescue Mailchimp::Error => e
  end
end
