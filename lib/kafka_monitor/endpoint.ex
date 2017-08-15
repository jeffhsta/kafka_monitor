defmodule KafkaMonitor.Endpoint do
  use Phoenix.Endpoint, otp_app: :kafka_monitor

  socket "/socket", KafkaMonitor.UserSocket

  plug Plug.Static,
    at: "/", from: :kafka_monitor, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_kafka_monitor_key",
    signing_salt: "lO95gxZx"

  plug KafkaMonitor.Router
end
