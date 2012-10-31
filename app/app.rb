class Scavenger < Padrino::Application

  enable :sessions

  # Enables render()
  register Padrino::Rendering

  # For mailing...?
  register Padrino::Mailer

  # Lots of small useful functions.
  register Padrino::Helpers

  register Padrino::Cache # includes helpers
  enable :caching         # turns on caching
  set :cache, Padrino::Cache::Store::Memory.new(50)

  # Because we need to make sure ActiveRecord cleans up after itself.
  use ActiveRecord::ConnectionAdapters::ConnectionManagement

  use Rack::Session::Cookie
  use OmniAuth::Builder do
    provider :developer if PADRINO_ENV == "development"
    provider :github,   ENV['GITHUB_KEY'],   ENV['GITHUB_SECRET'], scope: "user,gist"
  end

  set :show_exceptions, true

  use Rack::Lint
end
