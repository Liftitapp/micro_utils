defmodule TestServers do
  defmodule NothingServer do
    use MicroUtils.AMQP.Server,
      event: "test_queue",
      size: 3,
      conn_name: ConnHub

    @impl true
    def execute(params, context) do
      :noreply
    end
  end
end
