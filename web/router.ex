defmodule KafkaMonitor.Router do
  use KafkaMonitor.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KafkaMonitor do
    pipe_through :api

    get "/", IndexController, :index
  end
end
