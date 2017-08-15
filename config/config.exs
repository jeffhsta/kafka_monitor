use Mix.Config

config :kafka_monitor,
  ecto_repos: [KafkaMonitor.Repo]

config :kafka_monitor, KafkaMonitor.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0harKmngFRjebvDOw/DVC9B771pLfsYFXJhBCy5Ex4kUJGfU1KkgfUYpSNCSshJ2",
  render_errors: [view: KafkaMonitor.ErrorView, accepts: ~w(json)],
  pubsub: [name: KafkaMonitor.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id],
  level: :debug

config :kafka_ex,
  brokers: [
    {"kafka", 9092},
  ],
  consumer_group: "kafka-monitor",
  disable_default_worker: false,
  sync_timeout: 3000,
  max_restarts: 10,
  max_seconds: 60,
  use_ssl: false,
  kafka_version: "0.9.0"

import_config "#{Mix.env}.exs"
