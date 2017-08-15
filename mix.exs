defmodule KafkaMonitor.Mixfile do
  use Mix.Project

  def project, do:
  [
    app: :kafka_monitor,
    version: "0.0.1",
    elixir: "~> 1.2",
    elixirc_paths: elixirc_paths(Mix.env),
    compilers: [:phoenix] ++ Mix.compilers,
    build_embedded: Mix.env == :prod,
    start_permanent: Mix.env == :prod,
    aliases: aliases(),
    deps: deps()
  ]

  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_), do: ["lib", "web"]

  def application, do:
  [
    mod: {KafkaMonitor, []},
    applications: [:phoenix, :phoenix_pubsub, :cowboy, :logger, :kafka_ex]
  ]

  defp deps, do:
  [
    {:phoenix, "~> 1.2.4"},
    {:phoenix_pubsub, "~> 1.0"},
    {:cowboy, "~> 1.0"},
    {:kafka_ex, "~> 0.7"},
  ]

  defp aliases, do: []
end
