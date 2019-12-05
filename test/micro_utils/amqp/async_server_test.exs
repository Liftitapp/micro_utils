defmodule MicroUtils.AMQP.AsyncServerTest do
  use ExUnit.Case
  alias MicroUtils.AMQP.AsyncClient
  import Mock

  test "call the execute function via amqp async " do
    {:ok, pid} = Agent.start(fn -> nil end)

    with_mock TestServers.NothingServer,
      execute: fn params, context ->
        Agent.update(pid, fn _ ->
          {params, context}
        end)

        :noreply
      end do
      AsyncClient.publish("message", conn_name: ConnHub, queue: "test_queue")
      Process.sleep(1000)
      assert {"message", %{event: "test_queue"}} = Agent.get(pid, & &1)
    end
  end
end
