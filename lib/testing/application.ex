defmodule Testing.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Testing.Repo,
      # Start the Telemetry supervisor
      TestingWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Testing.PubSub},
      # Start the Endpoint (http/https)
      TestingWeb.Endpoint
      # Start a worker by calling: Testing.Worker.start_link(arg)
      # {Testing.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Testing.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TestingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
