defmodule Ask.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Ask.Repo,
      # Start the Telemetry supervisor
      AskWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ask.PubSub},
      # Start the Endpoint (http/https)
      AskWeb.Endpoint
      # Start a worker by calling: Ask.Worker.start_link(arg)
      # {Ask.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ask.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AskWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
