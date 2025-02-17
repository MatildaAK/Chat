defmodule Newchat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NewchatWeb.Telemetry,
      Newchat.Repo,
      {DNSCluster, query: Application.get_env(:newchat, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Newchat.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Newchat.Finch},
      # Start a worker by calling: Newchat.Worker.start_link(arg)
      # {Newchat.Worker, arg},
      # Start to serve requests, typically the last entry
      NewchatWeb.Endpoint,
      NewchatWeb.Presence
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Newchat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NewchatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
