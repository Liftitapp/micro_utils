defmodule MicroUtils.AMQP.ServerTest do
  use ExUnit.Case
  alias MicroUtils.AMQP.Client
  import Mock

  test "call the execute function from " do
    {:ok, pid} = Agent.start(fn -> nil end)

    with_mock TestServers.NothingServer,
      execute: fn params, context -
        Agent.update(pid, fn _ ->
          {params, context}
        end)

        :noreply
      end do
      Client.publish("message", conn_name: ConnHub, queue: "test_queue")
      Process.sleep(1000)
      {params, context} = Agent.get(pid, & &1)
      require IEx
      IEx.pry()
      assert params == "message"
    end
  end
end
