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
    email = String(params["email"]).gsub(/\s+/, "+")
    hexmail = Digest::MD5.hexdigest(email)
    list_id = ENV.fetch("MAILCHIMP_LIST_ID")
    api_key = ENV.fetch("MAILCHIMP_API_KEY")
    gibbon = Gibbon::Request.new(api_key: api_key)
    timestamp = Time.now.strftime("%m/%d/%Y")

    log.info "#{email} consenting #{timestamp}"

    log.debug gibbon.lists(list_id).members(hexmail).upsert(body: {email_address: email, status: "subscribed", merge_fields: {WEB_GDPR: timestamp}})
  rescue Gibbon::MailChimpError => e
    log.error "Houston, we have a problem: #{e.message} - #{e.raw_body}"
  ensure
    redirect "https://envoyofbelfast.com/pages/thankyou"
  end

  def log
    Logger.new(STDOUT)
  end
end
