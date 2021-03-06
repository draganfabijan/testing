# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :testing,
  ecto_repos: [Testing.Repo]

config :testing, :pow,
  user: Testing.Users.User,
  repo: Testing.Repo

# Configures the endpoint
config :testing, TestingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Hbga1SAHq8lFKeynxEvclM3VfeAH9LYYCUFM3CPj8bw5NZnheCJm1GFMECQwwA4S",
  render_errors: [view: TestingWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Testing.PubSub,
  live_view: [signing_salt: "mYWn1kWU"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
