use Mix.Config

config :gen_amqp,
  connections: [
    {:static, StaticConnSup, [{ConnHub, "amqp://guest:guest@localhost"}]}
  ],
  error_handler: TestErrorHandler
