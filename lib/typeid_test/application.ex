defmodule TypeidTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TypeidTestWeb.Telemetry,
      TypeidTest.Repo,
      {DNSCluster, query: Application.get_env(:typeid_test, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TypeidTest.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TypeidTest.Finch},
      # Start a worker by calling: TypeidTest.Worker.start_link(arg)
      # {TypeidTest.Worker, arg},
      # Start to serve requests, typically the last entry
      TypeidTestWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TypeidTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TypeidTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
