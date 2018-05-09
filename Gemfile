# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby "2.5.1"

# Added at 2018-05-09 14:20:11 +0100 by pete:
gem "sinatra", "~> 2.0", require: 'sinatra/base'
gem "gibbon"
gem "puma"

group :development, :test do
  gem "dotenv"
  gem "shotgun"
end
