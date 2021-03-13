defmodule StarTracker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      StarTracker.Repo,
      # Start the Telemetry supervisor
      StarTrackerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: StarTracker.PubSub},
      # Start the Endpoint (http/https)
      StarTrackerWeb.Endpoint
      # Start a worker by calling: StarTracker.Worker.start_link(arg)
      # {StarTracker.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StarTracker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    StarTrackerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
