defmodule TestServers do
  defmodule NothingServer do
    use MicroUtils.AMQP.AsyncServer,
      event: "test_queue",
      size: 3,
      conn_name: ConnHub

    @impl true
    def execute(_params, _context) do
      :noreply
    end
  end
end
