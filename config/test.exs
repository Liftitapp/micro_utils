use Mix.Config

config :micro_utils, TestEndpoint,
  url: [host: "localhost"],
  http: [port: 4000],
  server: true

config :gen_amqp,
  connections: [
    {:static, StaticConnSup, [{ConnHub, "amqp://guest:guest@localhost"}]}
  ],
  error_handler: TestErrorHandler

config :phoenix, :json_library, Jason
