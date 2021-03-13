# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :star_tracker,
  ecto_repos: [StarTracker.Repo]

# Configures the endpoint
config :star_tracker, StarTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IIXyDgzFINLRZMYwn9ZnU11t36U1k6NEL9v5s3m5KDZMLwMUkVnUiN594mFYCfao",
  render_errors: [view: StarTrackerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: StarTracker.PubSub,
  live_view: [signing_salt: "tDFutW7g"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
